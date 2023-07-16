<?php

namespace App\Http\Controllers;

use App\Models\PostCategory;
use Illuminate\Http\Request;

class PostCategoryController extends Controller
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
        return PostCategory::all();
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {
        $new_post_category = PostCategory::create([
            "name"=>$request->name,
            "slug"=>$request->slug
        ]);
        return response()->json(["message"=>"Thêm danh mục bài viết thành công","new_post_category"=>$new_post_category]);
    }

    /**
     * Display the specified resource.
     */
    public function show(PostCategory $category)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, PostCategory $category)
    {
        $category->name = $request->name;
        $category->slug = $request->slug;
        $category->save();
        return response()->json(["message"=>"Đã sửa danh mục bài viết","edited_post_category"=>$category]);
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(PostCategory $category)
    {
        $category->delete();
        return response()->json(["message"=>"Đã xóa danh mục bài viết"]);
    }
}
