<?php

namespace App\Http\Controllers;

use App\Models\Post;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Storage;
use Illuminate\Support\Facades\Gate;

class PostController extends Controller
{
    public function __construct()
    {
        $this->middleware('auth:sanctum')->only(['store','update','destroy']);
    }
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        return Post::with('post_category')->with('author')->latest()->paginate(5);
    }

    public function posts_category($category_id)
    {
        return Post::with('post_category')->with('author')->where("post_category_id",$category_id)->paginate(5);
    }

    public function product(Request $request)
    {
        return Post::where("product_id",$request->product_id)->get()->map(function($item){
            $item['category'] = $item->post_category;
            return $item;
        });
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {
        if (!Gate::forUser($request->user())->allows('author-action')) {
            return response()->json(["message"=>"Bạn không phải là author, bạn không có quyền này ?"],403);
        }
        Post::create([
            "title"=>$request->post_title,
            "slug"=>$request->post_slug,
            "description"=>$request->post_description,
            "content"=>$request->post_content,
            "author_id"=>$request->user()->id,
            "product_id"=>$request->product_id,
            "post_category_id"=>$request->post_category,
            "post_thumbnail"=>$request->file("thumbnail")->store("images/post_thumbnails"),
            "images"=> $request->has("post_images") ? $request->get("post_images") : json_encode(array())
        ]); 
        return response()->json(["message"=>"Thêm bài viết thành công"]);
    }

    /**
     * Display the specified resource.
     */
    public function show(Post $post)
    {
        $postCategory = new PostCategoryController();
        $post["post_categories"] = $postCategory->index();
        return $post;
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, Post $post)
    { 
        if (!Gate::forUser($request->user())->allows('author-action')) {
            return response()->json(["message"=>"Bạn không phải là author, bạn không có quyền này ?"],403);
        }
        if (!Gate::forUser($request->user())->allows('update-post',$post)) {
            return response()->json(["message"=>"Bạn không phải là tác giả của bài viết này ?"],403);
        }
        $new_images = array();
        preg_match_all('|<figure class="image">(.*)</figure>|U',$request->post_content,$matches);
        foreach($matches[1] as $item){
            preg_match("#images/post_images/(.*).((jpg)|(png))#",$item,$match);
            if(array_key_exists(0,$match)){
                $new_images[] = $match[0];
            }
        }
        $fullDiff_images = array_merge(array_diff(json_decode($post->images), $new_images), array_diff($new_images, json_decode($post->images)));
        foreach($fullDiff_images as $item){
            if(in_array($item,json_decode($post->images))){
                Storage::delete($item);
            }
        }
        $post->title = $request->post_title;
        $post->slug = $request->post_slug;
        $post->description = $request->post_description;
        if($request->has("thumbnail")){
            Storage::delete($post->post_thumbnail);
            $post->post_thumbnail = $request->file("thumbnail")->store("images/post_thumbnails");
        }
        $post->post_category_id = $request->post_category;
        $post->content = $request->post_content;
        $post->images = json_encode($new_images);
        $post->save();
        return response()->json(["message"=>"Sửa bài viết thành công"],200);
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(Request $request,Post $post)
    {
        if (!Gate::forUser($request->user())->allows('author-action')) {
            return response()->json(["message"=>"Bạn không phải là author, bạn không có quyền này ?"],403);
        }
        if (!Gate::forUser($request->user())->allows('delete-post',$post)) {
            return response()->json(["message"=>"Bạn không phải là tác giả của bài viết này ?"],403);
        }
        foreach(json_decode($post->images) as $post_image){
            Storage::delete($post_image);
        }
        $post->delete();
        return response()->json(["message"=>"post deleted successfully"],200);
    }

    public function upload(Request $request)
    {
        $path = $request->file("file")->store("images/post_images");
       
        return response()->json(["image_url" => asset($path),"image_path" => $path]);
    }

    public function incrementView(Post $post)
    {
        $post->view += 1;
        $post->save();
    }

    public function latest(Request $request,$post_category_id = null)
    {
        if($post_category_id){
            return Post::with('post_category')->with('author')->where("post_category_id",$post_category_id)->orderBy("id","desc")->limit(6)->get();
        }else{
            return Post::with('post_category')->with('author')->orderBy("id","desc")->limit(6)->get();
        }
    }

    public function most_viewed(Request $request,$post_category_id = null)
    {
        if($post_category_id){
            return Post::with('post_category')->with('author')->where("post_category_id",$post_category_id)->orderBy("view","desc")->limit(6)->get();
        }else{
            return Post::with('post_category')->with('author')->orderBy("view","desc")->limit(6)->get();
        }
    }
}
