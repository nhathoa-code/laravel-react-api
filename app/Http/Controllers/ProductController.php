<?php

namespace App\Http\Controllers;

use App\Models\Product;
use App\Models\Category;
use App\Models\Brand;
use App\Models\Post;
use App\Models\ProductsGroup;
use App\Models\Suggestion;
use App\Models\Review;
use App\Models\FlashSale;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Storage;
use Illuminate\Support\Str;
use App\Http\Controllers\CategoryController;
use Illuminate\Support\Facades\File;
use Illuminate\Support\Facades\Auth;

class ProductController extends Controller
{
    public function __construct()
    {
        $this->middleware('auth:sanctum')->only(['store','upload','update','destroy']);
    }
    /**
     * Display a listing of the resource.
     */
    public function index(Request $request)
    {
        if($request->has("admin")){
            return Product::orderBy("id","desc")->paginate(5);
        }
        return Category::where("parent_id",0)->get()->map(function($cat){
            $cat["products"] = DB::table('products')->whereIn('id',DB::table('product_categories')->where('category_id',$cat->id)->pluck("product_id"))->where("home_display",1)->orderBy("id","desc")->get()->map(function($product){
                $product->reviews = array("average_star"=> (float)Review::where("product_id",$product->id)->avg("star"),"total_reviews"=>Review::where("product_id",$product->id)->count());
                return $product;
            });
            return $cat;
        });
      
    }

    public function filterByCategories(Request $request)
    {
       $categories = json_decode($request->categories);
       $brands = json_decode($request->brands);
    
       if(empty($categories) && empty($brands)){
        return Product::orderBy("id","desc")->paginate(5);
       } 
       
       $filter_by_brands = DB::table("products_brands")->join("products","products_brands.product_id","=","products.id")->select("products.*")->whereIn("products_brands.brand_id",$brands)->orderBy("id","desc")->get()->unique('id');
       
       $filter_by_categories = DB::table("product_categories")->join("products","product_categories.product_id","=","products.id")->select("products.*")->whereIn("product_categories.category_id",$categories)->orderBy("id","desc")->get()->unique('id');   
       
       return $filter_by_categories->merge($filter_by_brands)->paginate(5);

    }

    public function filterByName(Request $request){
        return Product::where("name","like","%{$request->product_name}%")->paginate(5);
    }

    public function findSuggestionProducts(Request $request){
        return DB::table("product_categories")->join("products","products.id","=","product_categories.product_id")->select("products.*")->where("product_categories.category_id",16)->where("name","like","%{$request->product_name}%")->limit(5)->get();
    }

    public function searchFlashSaledProducts(Request $request)
    {
        return Product::where("name","like","%$request->product_name%")->limit(5)->get();
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {   
        $dir = time();
        $product = new Product();
        $product->name = $request->input("p_name");
        $product->slug = $request->input("slug");
        $product->price = str_replace('.', '', $request->input("p_price"));
        $product->discounted_price = str_replace('.', '', $request->input("p_discounted_price"));
        $product->image = $request->file("p_image")->store("images/products/$dir");
        $product->specification = $request->input("specification");
        $product->description = $request->input("description");
        $product->description_images = $request->has("description_images") ? $request->get("description_images") : json_encode(array());
        if($request->has("home_display")){
            $product->home_display = 1;
        }
        $product->dir = $dir;
        try {
            $product->save();
        } catch (\Exception $e) {
            return $e->getMessage();
            Storage::delete($product->image);
        }
        $id = $product->id;
        foreach ($request->input("categories") as $cat_id) {
            DB::table('product_categories')->insert([
                'product_id' => $id,
                'category_id' => $cat_id
            ]);
        }

        if ($request->has("gallery")) {
            foreach ($request->file("gallery") as $file) {
                $file->store("images/products/$dir/gallery");
            }
        }

        if($request->has("p_inventory")){
            DB::table("inventory")->insert([
                "product_id"=>$id,
                "quantity"=>$request->input("p_inventory")
            ]);
        }

        if($request->has("brands")){
            foreach($request->input("brands") as $brand_id){
                DB::table('products_brands')->insert([
                    'product_id' => $id,
                    'category_id'=>explode("/",$brand_id)[0],
                    'brand_id' => explode("/",$brand_id)[1]
                ]);
            }
        }

        if($request->has("categories_attributes")){
            foreach ($request->input("categories_attributes") as $cat_attr) {
                DB::table('product_category_attribute_values')->insert([
                    'product_id' => $id,
                    'category_id'=>explode("/",$cat_attr)[0],
                    'category_attribute_value_id' => explode("/",$cat_attr)[1]
                ]);
            }
        }

        if ($request->has("how_many_colors")) {
            for ($i = 0; $i < (int)$request->input("how_many_colors"); $i++) {
                $path = $request->file("product_color_" . $i)->store("images/products/$dir");
                $color_id = DB::table('product_colors')->insertGetId([
                    'product_id' => $id,
                    'color' => $path,
                    'color_name' => $request->input("p_color_image_name_$i")
                ]);
                $arr = explode("/", explode(".", $path)[0]);
                $name = end($arr);
                foreach ($request->file("product_color_gallery_" . $i) as $file) {
                    $file->store("images/products/$dir/$name");
                }
                DB::table("inventory")->insert([
                    "product_id"=>$id,
                    "color_id"=>$color_id,
                    "quantity"=>$request->input("p_inventory_of_color_$i")
                ]);
            }
        };

        if($request->has("products_group")){
            DB::table('groups_products_link')->insert([
                'product_id' => $id,
                'group_id' => $request->input("products_group"),
                'version_name' => $request->input("version_name")
            ]);
        }

        if($request->has("suggestion_products")){
            $suggested_products = json_decode($request->input("suggestion_products"));
            foreach($suggested_products as $item){
                Suggestion::create([
                    'product_id'=>$product->id,
                    'suggestion_product_id'=>$item
                ]);
            }
        }
        return response()->json(["message"=>"Thêm sản phẩm thành công"],200);
    }

    public function upload(Request $request)
    {

        $path = $request->file("file")->store("images/description_images");

        return response()->json(["image_url" => asset($path),"image_path" => $path]);
    }

    /**
     * Display the specified resource.
     */
    public function show(Request $request,Product $product)
    {
        $product['cats'] = $product->categories->map(function($item){
            return $item->category_id;
        });
        $product['brands'] = DB::table("products_brands")->where("product_id",$product->id)->get()->map(function($item){
            return $item->brand_id;
        });

        if(DB::table("inventory")->where("product_id",$product->id)->whereNull("color_id")->first()){
            $product['inventory'] = DB::table("inventory")->where("product_id",$product->id)->whereNull("color_id")->value("quantity");
        }

        $product['suggestion'] = DB::table("suggestion")->join("products","products.id","=","suggestion.suggestion_product_id")->select("products.*")->where("suggestion.product_id",$product->id)->get();

        $product['posts'] = Post::where("product_id",$product->id)->limit(5)->get();
        $product['reviews'] = Review::where("product_id",$product->id)->latest()->get()->map(function($item){
            $item->reviewer = DB::table("profiles")->where("user_id",$item->user_id)->first(["name"]);
            if(Storage::exists("images/review/$item->id")){
                $item->images = Storage::files("images/review/$item->id");
            }
            return $item;
        });

        $product['suggestion'] = DB::table("suggestion")->join("products","products.id","=","suggestion.suggestion_product_id")->select("products.*")->where("suggestion.product_id",$product->id)->get();
        $category_controller = new CategoryController();
        $categories_attributes = array();
        foreach($product['cats'] as $cat){
            $category_attributes = array();
            $category_attributes['category_name'] = DB::table("categories")->where("id",$cat)->first()->name;
            $category_attributes['id'] = $cat;
            $categories_attributes_brands = $category_controller->categoryAttributes($request,$cat);
            $category_attributes['attributes_values'] = isset($categories_attributes_brands['attributes']) ? $categories_attributes_brands['attributes'] : [];
            if(isset($categories_attributes_brands['brands'])){
                $category_attributes['brands'] = $categories_attributes_brands['brands'];
            }
            $categories_attributes[] = $category_attributes;
        }
       $product['categories_attributes'] = $categories_attributes;
       $product['category_attributes_values'] = DB::table("product_category_attribute_values")->where("product_id",$product->id)->pluck("category_attribute_value_id");


       /**
        * produc gallery
        */

        if(File::exists("images/products/$product->dir/gallery")) {
            $product['gallery'] = Storage::files("images/products/$product->dir/gallery"); 
        }

      
       $colors = DB::table("product_colors")->select(['id','color','color_name'])->where("product_id",$product->id)->get();
        if($colors->count() !== 0){
            $product_colors = array();
            foreach($colors as $color){
            $arr = array();
            $arr['color'] = $color;
            $color_dir = explode(".",$color->color)[0];
            $arr['gallery'] = Storage::files($color_dir);
            $arr['inventory'] = DB::table("inventory")->where("product_id",$product->id)->where("color_id",$color->id)->value("quantity");
            $product_colors[] = $arr;
        }
         $product['colors'] = $product_colors;
        }
     
     
       $product_group = DB::table("groups_products_link")->where("product_id",$product->id)->first();
        if($product_group){
            $product['product_group'] = array("group_id"=>$product_group->group_id,"version_name"=>$product_group->version_name);
            $group = ProductsGroup::find($product_group->group_id);
            $groups = ProductsGroup::where("category_id",$group->category_id);
            if($group->brand_id){
               $groups->where("brand_id",$group->brand_id);
            }
            $product['groups'] = $groups->get();
            $product->group_id = $product_group->group_id;
            $product['products_in_group'] = $product->products_in_group();
        }

        $flash_sale = FlashSale::where("product_id",$product->id)->first();
        if($flash_sale){
            if($flash_sale->start_time < date('Y-m-d H:i:s') && date('Y-m-d H:i:s') < $flash_sale->end_time){
                $product['flash_sale'] = true;
                $product['flash_sale_start_time'] = $flash_sale->start_time;
                $product['flash_sale_end_time'] = $flash_sale->end_time;
                $product['discounted_price_backup'] = $product->discounted_price;
                $product['discounted_price'] = $flash_sale->discounted_price;
            }
        }
        return $product;
    }

    /**
     * Display the specified resource by slug.
     */

    public function slug(Request $request,Product $product)
    {
        $product['user'] = Auth::check();
        return $this->show($request,$product);
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, Product $product)
    {
        /**
         * update product data
         */
        $product->name = $request->input("p_name");
        $product->slug = $request->input("slug");
        $product->price = str_replace('.', '', $request->input("p_price"));
        $product->discounted_price = str_replace('.', '', $request->input("p_discounted_price"));
        $product->specification = $request->input("specification");
        $product->description = $request->input("description");
        if($request->has("home_display")){
            $product->home_display = 1;
        }else{
               $product->home_display = 0;
        }
        if($request->hasFile("p_image")){
            Storage::delete($product->image);
            $product->image = $request->file("p_image")->store("images/products/$product->dir");
        }

        if($request->has("p_inventory")){
            if(DB::table("inventory")->where("product_id",$product->id)->whereNull("color_id")->first()){
                DB::table("inventory")->where("product_id",$product->id)->whereNull("color_id")->increment("quantity",$request->input("p_inventory"));
            }else{
                DB::table("inventory")->insert([
                    "product_id"=>$product->id,
                    "quantity"=>$request->input("p_inventory")
                ]);
            }
          
        }

        /**
         * update description images
         */
        $new_description_images = array();
        preg_match_all('|<figure class="image">(.*)</figure>|U',$request->description,$matches);
        foreach($matches[1] as $item){
            preg_match("#images/description_images/(.*).((jpg)|(png))#",$item,$match);
            if(array_key_exists(0,$match)){
                $new_description_images[] = $match[0];
            }
        }
        $fullDiff_description_images = array_merge(array_diff(json_decode($product->description_images), $new_description_images), array_diff($new_description_images, json_decode($product->description_images)));
        foreach($fullDiff_description_images as $item){
            if(in_array($item,json_decode($product->description_images))){
                Storage::delete($item);
            }
        }
        $product->description_images = json_encode($new_description_images);
     
        $product->save();


        /**
         * update gallery
         */
        if ($request->has("gallery")) {
            if($request->has("old_gallery")){
            $old_gallery = json_decode($request->input("old_gallery"));
            $gallery_on_storage = Storage::files("images/products/$product->dir/gallery");
            $gallery_image_to_remove = array_diff($gallery_on_storage,$old_gallery);
                foreach($gallery_image_to_remove as $item){
                    Storage::delete($item);
                }
            }else{
                if(Storage::files("images/products/$product->dir/gallery") && !empty(Storage::files("images/products/$product->dir/gallery"))){
                    Storage::deleteDirectory("images/products/$product->dir/gallery");
                }
            }
            foreach ($request->file("gallery") as $file) {
                $file->store("images/products/$product->dir/gallery");
            }
        }else{
            if($request->has("old_gallery")){
                $old_gallery = json_decode($request->input("old_gallery"));
                $gallery_on_storage = Storage::files("images/products/$product->dir/gallery");
                $gallery_image_to_remove = array_diff($gallery_on_storage,$old_gallery);
                foreach($gallery_image_to_remove as $item){
                    Storage::delete($item);
                }
            }else{
                if(Storage::files("images/products/$product->dir/gallery") && !empty(Storage::files("images/products/$product->dir/gallery"))){
                    Storage::deleteDirectory("images/products/$product->dir/gallery");
                }
            }   
          
        }

         /**
         * update product colors
         */
        $old_product_colors = json_decode($request->input("old_product_colors"));
        $colors_remained = array();
        foreach($old_product_colors as $color){
            $isNewColorUploaded = false;
            $arr = explode("/", explode(".", $color->color_path)[0]);
            $color_file_name = end($arr);
            $colors_remained[] = $color->color_path;
            if($request->hasFile("new_color_{$color->color->id}")){
                $isNewColorUploaded = true;
                Storage::delete($color->color->color);
                $file_path = $request->file("new_color_{$color->color->id}")->store('images/products/'.$product->dir);
                $new_color = $file_path;
                $arr = explode("/", explode(".", $file_path)[0]);
                $new_color_file_name = end($arr);
                DB::table('product_colors')->where('id',$color->color->id)->update(['color' => $new_color]);
                array_filter($colors_remained,function($item) use($color){
                    return $item !== $color->color->color;
                });
                $colors_remained[] = $new_color;
            }
            
            $color_gallery_remained = array();
            foreach($color->gallery as $item){
                if($item->status === "old"){
                    $color_gallery_remained[] = $item->image_path;
                }
            }
            $old_color_gallery = Storage::files("images/products/$product->dir/$color_file_name");
            $color_gallery_image_to_remove = array_diff($old_color_gallery,$color_gallery_remained);
       
            foreach($color_gallery_image_to_remove as $item){
                 Storage::delete($item);
            }
 
            if($request->hasFile("gallery_of_color_{$color->color->id}")){
                foreach($request->file("gallery_of_color_{$color->color->id}") as $file){
                    $file->store("images/products/".$product->dir."/".$color_file_name);
                }
            }
            if($isNewColorUploaded){
                Storage::move("images/products/$product->dir/$color_file_name", "images/products/$product->dir/$new_color_file_name");
            }
      
            DB::table('product_colors')->where('id',$color->color->id)->update(['color_name'=>$request->input("color_name_of_{$color->color->id}")]);
            if($request->has("p_inventory_of_color_{$color->color->id}")){
                DB::table("inventory")->where("product_id",$product->id)->where("color_id",$color->color->id)->increment("quantity",$request->input("p_inventory_of_color_{$color->color->id}"));
            }
        }
        $product_colors_from_db = DB::table("product_colors")->where("product_id",$product->id)->pluck("color")->toArray();
        $colors_to_remove = array_diff($product_colors_from_db,$colors_remained);
        foreach($colors_to_remove as $item){
            DB::table('product_colors')->where('product_id', $product->id)->where('color',$item)->delete();
            Storage::delete($item);
            Storage::deleteDirectory(explode(".",$item)[0]);
        }
        /**
         * update categories
         */
        $categories = DB::table("product_categories")->where("product_id",$product->id)->pluck("category_id")->toArray();
        $fullDiff_categories = array_merge(array_diff($request->input("categories"), $categories), array_diff($categories, $request->input("categories")));
        foreach ($fullDiff_categories as $item) {
            if (in_array($item, $categories)) {
                DB::table("product_categories")->where("product_id",$product->id)->where("category_id",$item)->delete();
                DB::table("product_category_attribute_values")->where("product_id",$product->id)->where("category_id",$item)->delete();
            } else {
                DB::table("product_categories")->insert([
                "product_id"=>$product->id,
                "category_id"=>$item
                ]);
            }
        }
        /**
         * update brands
         */
        $brands = DB::table("products_brands")->where("product_id",$product->id)->get()->map(function($item){
            return "$item->category_id/$item->brand_id";
        })->toArray();
        $fullDiff_brands = array_merge(array_diff($request->has("brands") ? $request->input("brands") : [], $brands), array_diff($brands, $request->has("brands") ? $request->input("brands") : []));
        foreach ($fullDiff_brands as $item) {
            if (in_array($item, $brands)) {
                DB::table("products_brands")->where("product_id",$product->id)->where("brand_id",explode("/",$item)[1])->delete();
            } else {
                    DB::table("products_brands")->insert([
                    "product_id"=>$product->id,
                    "category_id"=>explode("/",$item)[0],
                    "brand_id"=>explode("/",$item)[1]
                    ]);
            }
        }         
        /**
         * update product category attributes
         */
        if($request->has("categories_attributes_values")){
             $categories_attributes_values = array_map(function($item){
                return "$item->category_id/$item->category_attribute_value_id";
             },DB::table("product_category_attribute_values")->select("category_id","category_attribute_value_id")->where("product_id",$product->id)->get()->toArray());
            $fullDiff_categories_attributes_values = array_merge(array_diff($request->has("categories_attributes_values") ? $request->input("categories_attributes_values") : [], $categories_attributes_values), array_diff($categories_attributes_values, $request->has("categories_attributes_values") ? $request->input("categories_attributes_values") : []));
            foreach ($fullDiff_categories_attributes_values as $item) {
                if (in_array($item, $categories_attributes_values)) {
                    DB::table("product_category_attribute_values")->where("product_id",$product->id)->where("category_attribute_value_id",explode("/",$item)[1])->delete();
                } else {
                        DB::table("product_category_attribute_values")->where("product_id",$product->id)->insert([
                        "product_id"=>$product->id,
                        "category_id"=>explode("/",$item)[0],
                        "category_attribute_value_id"=>explode("/",$item)[1]
                        ]);
                }
            }
        }
       
       
        /**
         * upload new colors
         */
        if ($request->has("how_many_colors")) {
            for ($i = 0; $i < (int)$request->input("how_many_colors"); $i++) {
                $path = $request->file("product_color_" . $i)->store("images/products/$product->dir");
                $color_id = DB::table('product_colors')->insertGetId([
                    'product_id' => $product->id,
                    'color' => $path,
                    'color_name' => $request->input("p_color_image_name_$i")
                ]);
                $arr = explode("/", explode(".", $path)[0]);
                $name = end($arr);
                foreach ($request->file("product_color_gallery_" . $i) as $file) {
                    $file->store("images/products/$product->dir/$name");
                }

                DB::table("inventory")->where("product_id",$product->id)->whereNull("color_id")->delete();

                DB::table("inventory")->insert([
                    "product_id"=>$product->id,
                    "color_id"=>$color_id,
                    "quantity"=>$request->input("p_inventory_of_color_$i")
                ]);
            }
        };

        /**
         * update product group
         */
        if($request->has("products_group")){
            DB::table('groups_products_link')->updateOrInsert(
                ['product_id' => $product->id],
                ['group_id' => $request->input("products_group"),'version_name' => $request->input("version_name")]
            );
        }else{
            DB::table("groups_products_link")->where("product_id",$product->id)->delete();
        }

        /**
         * update suggestion
         */
        $suggestion_from_db = Suggestion::where("product_id",$product->id)->pluck("suggestion_product_id")->toArray();
        $fullDiff_suggestion = array_merge(array_diff(json_decode($request->input("suggestion_products")), $suggestion_from_db), array_diff($suggestion_from_db, json_decode($request->input("suggestion_products"))));
        
        foreach ($fullDiff_suggestion as $item) {
            if (in_array($item, $suggestion_from_db)) {
                Suggestion::where("product_id",$product->id)->where("suggestion_product_id",$item)->delete();
            } else {
                Suggestion::create([
                    'product_id'=>$product->id,
                    'suggestion_product_id'=>$item
                ]);
            }
        }   

        return response()->json(["message"=>"Sửa sản phẩm thành công"],200);
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(Product $product)
    {
        Storage::deleteDirectory("images/products/$product->dir");
        foreach(json_decode($product->description_images) as $description_image){
            Storage::delete($description_image);
        }
        $product->delete();
        return response()->json(["message"=>"Xóa sản phẩm thành công"],200);
    }

    public function filter(Request $request)  
    {
        $checked_values = json_decode($request->input('input'));
        $filtered_products = json_decode($request->input("productIds"));
        if(count($request->choosen_brands) > 0){
            $filtered_products = DB::table("products_brands")->whereIn("brand_id",$request->choosen_brands)->get()->pluck('product_id')->toArray();
        }
        foreach($checked_values as $item){
           if(!empty($item->values)){
              foreach($filtered_products as $id){
                if(count(DB::table("product_category_attribute_values")->where("product_id",$id)->whereIn("category_attribute_value_id",$item->values)->get()->toArray()) === 0){
                    $filtered_products = array_filter($filtered_products,function($item) use($id){
                        return $item !== $id;
                    });
              }
            }
           }
        }
        // return response()->json(['filtered_products'=>DB::table("products")->whereIn("id",$filtered_products)->orderBy("id","desc")->paginate($request->products_per_page)],200);
        return response()->json(['filtered_products'=>tap(DB::table("products")->whereIn("id",$filtered_products)->orderBy("id","desc")->paginate($request->products_per_page),function($paginatedInstance){
            return $paginatedInstance->getCollection()->transform(function ($product) {
                $product->reviews = array("average_star"=> (float)Review::where("product_id",$product->id)->avg("star"),"total_reviews"=>Review::where("product_id",$product->id)->count());
                return $product;
            });
        })],200);


    }

    public function searchTrend()
    {
        return Product::orderBy("search_click","desc")->limit(6)->get();
    }

    public function mostView()
    {
        return Product::orderBy("view","desc")->limit(6)->get();
    }

    public function searchKeyWord(Request $request)
    {
        if($request->has("compare")){
            return DB::table("product_categories")->join("products","products.id","=","product_categories.product_id")->select("products.*")->where("product_categories.category_id",$request->compare_cat)->where("products.name","like","%$request->keyword%")->orderBy("id","desc")->limit(5)->get()->map(function($item){
                $item->specification = json_decode($item->specification);
                return $item;
            });
            // return Product::where("name","like","%$request->keyword%")->orderBy("id","desc")->get()->map(function($item){
            //     $item->specification = json_decode($item->specification);
            //     return $item;
            // });
        }
        $keywords = explode(" ",$request->keyword);
        if(count($keywords) > 1){
            $searched_products = Product::where("name","like","%{$keywords[0]}%");
            for($i=1;$i < count($keywords); $i++){
                $searched_products->orWhere("name","like","%{$keywords[$i]}%");
            }
            return $searched_products->orderBy("id","desc")->paginate(10);
        }else{
            return Product::where("name","like","%$request->keyword%")->orderBy("id","desc")->paginate(10);
        }
       
    }

    public function incrementView(Product $product)
    {
        $product->view += 1;
        $product->save();
    }

    public function incrementSearchClick(Product $product)
    {
        $product->search_click += 1;
        $product->save();
    }
}
