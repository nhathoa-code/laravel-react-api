<?php

namespace App\Http\Controllers;

use App\Models\CategoryAttributeValue;
use Illuminate\Http\Request;

class CategoryAttributeValueController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index($category_attribute_id)
    {
        $category_attribute_values = CategoryAttributeValue::where("category_attribute_id", $category_attribute_id)->get();
        return response()->json(['category_attribute_values' => $category_attribute_values], 200);
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {
        return CategoryAttributeValue::create([
            "value" => $request->input("value"),
            "category_attribute_id" => $request->input("category_attribute_id")
        ]);
    }

    /**
     * Display the specified resource.
     */
    public function show(CategoryAttributeValue $categoryAttributeValue)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, CategoryAttributeValue $categoryAttributeValue)
    {
        $categoryAttributeValue->value = $request->input("value");
        $categoryAttributeValue->save();
        return response()->json(["message" => "Cập nhật thành công"], 200);
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(CategoryAttributeValue $categoryAttributeValue)
    {
        $categoryAttributeValue->delete();
        return response()->json(['message' => "OK"], 200);
    }
}
