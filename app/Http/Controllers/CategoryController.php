<?php

namespace App\Http\Controllers;

use App\Models\Category;
use App\Models\Brand;
use App\Models\Review;
use App\Models\Product;
use App\Models\CategoryAttribute;
use App\Models\CategoryAttributeValue;
use Illuminate\Http\Request;
use Illuminate\Support\Str;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Storage;
use Illuminate\Support\Facades\Gate;

class CategoryController extends Controller
{
    public function __construct()
    {
        $this->middleware('auth:sanctum')->except(['allCategories','categoryAttributes','categoryBrands']);
    }
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        $categories = Category::where("parent_id", 0)->get()->map(function($item){
            $brands = Brand::where("category_id",$item->id)->get();
            if($this->hasChildren($item->id)){
                $item['children'] = Category::where("parent_id", $item->id)->get();
            }
            if(count($brands) > 0){
                $item['brands'] = $brands;
            }
            $attributes = categoryAttribute::where("category_id",$item->id)->where("show/hide","1")->get();
            if(count($attributes) > 0){
                $item['attributes'] = $attributes->map(function($item){
                    $item['values'] = CategoryAttributeValue::where("category_attribute_id",$item->id)->get();
                    return $item;
                });
            }
            return $item;
        });
        return response()->json(["categories" => $categories]);
    }

    public function allCategories()
    {
        $data = array();
        $hasLoopedOverChildren = array();
        $categories = Category::where("parent_id", 0)->get();
        $this->loopCategories($data, $hasLoopedOverChildren, $categories);
        return $data;
    }

    public function loopCategories(&$data, &$hasLoopedOverChildren, $categories)
    {
        foreach ($categories as $cat) {
            if($cat['parent_id'] === 0){
                $cat['top_sold_products'] = DB::table("product_categories")->join("products","products.id","=","product_categories.product_id")->select("products.*")->where("product_categories.category_id",$cat['id'])->orderBy("sold","desc")->limit(2)->get();
                $attributes = categoryAttribute::where("category_id",$cat['id'])->where("show/hide","1")->get();
                if(count($attributes) > 0){
                $cat['attributes'] = $attributes->map(function($item){
                    $item['values'] = CategoryAttributeValue::where("category_attribute_id",$item->id)->get();
                    return $item;
                });
            }
            }
            if ($this->hasChildren($cat['id'])) {
                $cat['children'] = Category::where("parent_id", $cat['id'])->get()->map(function($item){
                    $brands = Brand::where("category_id",$item->id)->get();
                    if(count($brands)){
                        $item['brands'] = $brands;
                    }
                    return $item;
                });
                foreach ($cat['children'] as $item) {
                    $hasLoopedOverElements[] = $item['id'];
                }
                $this->loopCategories($data, $hasLoopedOverElements, $cat['children']);
            }
            if (!in_array($cat['id'], $hasLoopedOverChildren)) {
                $brands = Brand::where("category_id",$cat['id'])->get();
                if(count($brands)){
                    $cat['brands'] = $brands;
                }
                $data[] = $cat;
            }
        }
    }

    public function hasChildren($parent_id)
    {
        return count(Category::where("parent_id", $parent_id)->get()) > 0 ? true : false;
    }

    public function children($parent_id)
    {
        $children = Category::where("parent_id", $parent_id)->get();
        return response()->json(["children" => $children]);
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {
        if (!Gate::forUser($request->user())->allows('manager-action')) {
            return response()->json(["message"=>"Bạn không phải là manager, bạn không có quyền này ?"],403);
        }
        try {
            return Category::create([
                'name' => $request->input("name"),
                'slug' => $request->input("slug"),
                'icon' => $request->input("icon") ? $request->input("icon") : null,
                'image'=> $request->has("category_image") ? $request->file("category_image")->store("images/category") : null,
                'parent_id' => $request->has("parent_id") ? $request->input("parent_id") : 0
            ]);
        } catch (\Exception $e) {
            return $e->getMessage();
        }
    }

    /**
     * Display the specified resource.
     */
    public function show(Category $category)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, Category $category)
    {
        if (!Gate::forUser($request->user())->allows('manager-action')) {
            return response()->json(["message"=>"Bạn không phải là manager, bạn không có quyền này ?"],403);
        }
        $category->name = $request->input("name");
        $category->icon = $request->input("icon") ? $request->input("icon") : null;
        if($request->has("category_image")){
            if(!$category->image){
                Storage::delete($category->image);
            }
            $category->image = $request->file("category_image")->store("images/category");
        }
        $category->slug = $request->input("slug");
        $category->save();
        return response()->json(["updated_cat"=>$category,"message" => "Cập nhật thành công"], 200);
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(Request $request,Category $category)
    {
        if (!Gate::forUser($request->user())->allows('manager-action')) {
            return response()->json(["message"=>"Bạn không phải là manager, bạn không có quyền này ?"],403);
        }
        if($category->image){
            Storage::delete($category->image);
        }
        $category->delete();
        return response()->json(['message' => "OK"], 200);
    }

    public function categoryAttributes(Request $request,$category_id,$slug=null)
    {
        $data = array();
        if($slug){
            $category= Category::where("slug",$slug)->first();
            if(!$category){
                return response()->json(["message"=>"not found"],404);
            }
            $category_id = $category->id;
            $data["productIds"] = DB::table("product_categories")->where("category_id",$category_id)->pluck("product_id");
            // $data["products"] = DB::table("products")->whereIn("id",$data["productIds"])->orderBy("id","desc")->paginate($request->products_per_page);

            $data["products"] = tap(DB::table("products")->whereIn("id",$data["productIds"])->orderBy("id","desc")->paginate($request->products_per_page),function($paginatedInstance){
            return $paginatedInstance->getCollection()->transform(function ($product) {
                $product->reviews = array("average_star"=> (float)Review::where("product_id",$product->id)->avg("star"),"total_reviews"=>Review::where("product_id",$product->id)->count());
                return $product;
                });
            });
            $data["category"] = Category::where("slug",$slug)->first();
        }
        $attributes = CategoryAttribute::where('category_id',$category_id)->get();
        foreach ($attributes as $attr) {
            $attr_values = CategoryAttributeValue::where('category_attribute_id', $attr['id'])->get();
            $data["attributes"][] = array("name" => $attr['name'],"attr_id"=>$attr['id'] ,"values" => $attr_values);
        }
        $brands = Brand::where("category_id",$category_id)->get();
        if(count($brands) > 0){
            $data["brands"] = $brands;
        }
        return $data;
    }

    public function categoryBrands(Request $request)
    {   
        return DB::table("brands")->where("category_id",$request->category_id)->get();
    }

}
