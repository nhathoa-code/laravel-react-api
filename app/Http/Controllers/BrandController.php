<?php

namespace App\Http\Controllers;

use App\Models\Brand;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Storage;

class BrandController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index(Request $request)
    {
        return Brand::where("category_id",$request->category_id)->get();
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {
        $brand = new Brand();
        $brand->category_id = $request->category_id;
        $brand->name = $request->brand_name;
        if($request->has("brand_image")){
            $path = $request->file("brand_image")->store("images/brands/$request->category_id");
        }
        $brand->image = $path;
        $brand->save();
        return response()->json(['new_brand'=>$brand,'message'=>"Thêm nhà sản xuất thành công"]);
    }

    /**
     * Display the specified resource.
     */
    public function show(Brand $brand)
    {
        
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, Brand $brand)
    {
        $brand->name = $request->brand_name;
        if($request->has("brand_image")){
            Storage::delete($brand->image);
            $new_path = $request->file("brand_image")->store("images/brands/$brand->category_id");
            $brand->image = $new_path;
        }
        $brand->save();
        return response()->json(["message"=>"Updated successfully","updated_brand"=>$brand],200);
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(Brand $brand)
    {
        Storage::delete($brand->image);
        $brand->delete();
        return response()->json(['message'=>"Deleted sucessfully"]);
    }
}
