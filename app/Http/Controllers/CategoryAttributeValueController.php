<?php

namespace App\Http\Controllers;

use App\Models\CategoryAttributeValue;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Gate;

class CategoryAttributeValueController extends Controller
{
    public function __construct()
    {
        $this->middleware('auth:sanctum')->except('index');
    }
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
        if (!Gate::forUser($request->user())->allows('manager-action')) {
            return response()->json(["message"=>"Bạn không phải là manager, bạn không có quyền này ?"],403);
        }
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
        if (!Gate::forUser($request->user())->allows('manager-action')) {
            return response()->json(["message"=>"Bạn không phải là manager, bạn không có quyền này ?"],403);
        }
        $categoryAttributeValue->value = $request->input("value");
        $categoryAttributeValue->save();
        return response()->json(["message" => "Cập nhật thành công"], 200);
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(Request $request,CategoryAttributeValue $categoryAttributeValue)
    {
        if (!Gate::forUser($request->user())->allows('manager-action')) {
            return response()->json(["message"=>"Bạn không phải là manager, bạn không có quyền này ?"],403);
        }
        $categoryAttributeValue->delete();
        return response()->json(['message' => "OK"], 200);
    }
}
