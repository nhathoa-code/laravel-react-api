<?php

namespace App\Http\Controllers;

use App\Models\CategoryAttribute;
use Illuminate\Http\Request;

class CategoryAttributeController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index($category_id)
    {
        $category_attributes = CategoryAttribute::where("category_id", $category_id)->get();
        return response()->json(['category_attributes' => $category_attributes], 200);
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {
        //return var_dump($request->input("show/hide") ? '1' : '0');
        return CategoryAttribute::create([
            "name" => $request->input("name"),
            "category_id" => $request->input("category_id"),
            "show/hide" => $request->input("show/hide") ? '1' : '0',
        ]);
    }

    /**
     * Display the specified resource.
     */
    public function show(CategoryAttribute $categoryAttribute)
    {
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, CategoryAttribute $categoryAttribute)
    {
        $categoryAttribute->name = $request->input("name");
        $categoryAttribute->{"show/hide"} = $request->input("show/hide") ? '1' : '0';
        $categoryAttribute->save();
        return response()->json(["message" => "Cập nhật thành công"], 200);
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(CategoryAttribute $categoryAttribute)
    {
        $categoryAttribute->delete();
        return response()->json(['message' => "OK"], 200);
    }
}
