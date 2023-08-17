<?php

namespace App\Http\Controllers;

use App\Models\ProductsGroup;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Gate;

class ProductsGroupController extends Controller
{
     public function __construct()
    {
        $this->middleware('auth:sanctum')->except('index');
    }
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        $products_groups = DB::table("products_groups")->leftJoin("categories","categories.id","=","products_groups.category_id")->leftJoin("brands","brands.id","=","products_groups.brand_id")->select('products_groups.*','categories.name as category_name','brands.image as brand_image')->paginate(5);
        return response()->json(["products_groups" => $products_groups]);
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
            return ProductsGroup::create([
                'name' => $request->name,
                'category_id' => $request->category,
                'brand_id' => $request->has("brand") ? $request->brand : null
            ]);
        } catch (\Exception $e) {
            return $e->getMessage();
        }
    }

    /**
     * Display the specified resource.
     */
    public function show(ProductsGroup $productsGroup)
    {
        
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, ProductsGroup $productsGroup)
    {
        if (!Gate::forUser($request->user())->allows('manager-action')) {
            return response()->json(["message"=>"Bạn không phải là manager, bạn không có quyền này ?"],403);
        }
        $productsGroup->name = $request->name;
        $productsGroup->category_id = $request->category;
        $productsGroup->brand_id = $request->has("brand") ? $request->brand : null;
        $productsGroup->save();
        return response()->json(["message" => "Cập nhật thành công","edited_group"=>$productsGroup], 200);
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(Request $request,ProductsGroup $productsGroup)
    {
        if (!Gate::forUser($request->user())->allows('manager-action')) {
            return response()->json(["message"=>"Bạn không phải là manager, bạn không có quyền này ?"],403);
        }
        $productsGroup->delete();
        return response()->json(['message' => "OK"], 200);
    }

    public function group(Request $request)
    {
        $group = ProductsGroup::where("category_id",$request->category_id);
        if($request->has("brand_id")){
            $group->where("brand_id",$request->brand_id);
        }
        return $group->get();
    }
}
