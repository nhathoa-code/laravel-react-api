<?php

namespace App\Http\Controllers;

use App\Models\CategoryAttribute;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Gate;

class CategoryAttributeController extends Controller
{
    public function __construct()
    {
        $this->middleware('auth:sanctum')->except('index');
    }
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
        if (!Gate::forUser($request->user())->allows('manager-action')) {
            return response()->json(["message"=>"Bạn không phải là manager, bạn không có quyền này ?"],403);
        }
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
        if (!Gate::forUser($request->user())->allows('manager-action')) {
            return response()->json(["message"=>"Bạn không phải là manager, bạn không có quyền này ?"],403);
        }
        $categoryAttribute->name = $request->input("name");
        $categoryAttribute->{"show/hide"} = $request->input("show/hide") ? '1' : '0';
        $categoryAttribute->save();
        return response()->json(["message" => "Cập nhật thành công"], 200);
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(Request $request,CategoryAttribute $categoryAttribute)
    {
        if (!Gate::forUser($request->user())->allows('manager-action')) {
            return response()->json(["message"=>"Bạn không phải là manager, bạn không có quyền này ?"],403);
        }
        $categoryAttribute->delete();
        return response()->json(['message' => "OK"], 200);
    }
}
