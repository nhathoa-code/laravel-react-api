<?php

namespace App\Http\Controllers;

use App\Models\ReviewProve;
use App\Models\Product;
use App\Models\Review;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Storage;
use Illuminate\Support\Facades\Gate;

class ReviewToProveController extends Controller
{
    public function __construct()
    {
        $this->middleware('auth:sanctum')->only(['store','destroy']);
    }
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        return DB::table("reviews_to_prove")->join("products","products.id","=","reviews_to_prove.product_id")->select("products.name","products.image","reviews_to_prove.*",DB::raw("count(*) as reviews"))->groupBy("products.id")->get();
    }

    public function productReviews(Request $request)
    {
        return response()->json(["reviews"=>ReviewProve::where("product_id",$request->product_id)->get()->map(function($item){
            $item->reviewer = DB::table("profiles")->where("user_id",$item->user_id)->first(["name"]);
            if (Storage::exists("images/review_to_prove/$item->id")){
                 $item->review_images = Storage::files("images/review_to_prove/$item->id");
            } 
            return $item;
        }),"product"=>Product::find($request->product_id)]);
        
    }

    public function reviewProve(ReviewProve $review_to_prove)
    {   
        if (!Gate::forUser($request->user())->allows('manager-action')) {
            return response()->json(["message"=>"Bạn không phải là manager, bạn không có quyền này ?"],403);
        }
        $review = new Review();
        $review->user_id = $review_to_prove->user_id;
        $review->product_id = $review_to_prove->product_id;
        $review->star = $review_to_prove->star;
        $review->content = $review_to_prove->content;
        $review->created_at = $review_to_prove->created_at;
        $review->save();
        if (Storage::exists("images/review_to_prove/$review_to_prove->id")){
            $review_images = Storage::files("images/review_to_prove/$review_to_prove->id");
            foreach($review_images as $image){
                Storage::copy($image,str_replace("review_to_prove/$review_to_prove->id","review/$review->id",$image));
            }
            Storage::deleteDirectory("images/review_to_prove/$review_to_prove->id");
        } 
        $review_to_prove->delete();
        return response()->json(["message"=>"Ok..."],200);
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {
        $review = Review::where("user_id",$request->user()->id)->where("product_id",$request->product_id)->first();
        if($review){
            if(Storage::exists("images/review/$review->id")){
                Storage::deleteDirectory("images/review/$review->id");
            }
            $review->delete();
        }
        $review_to_prove = ReviewProve::where("user_id",$request->user()->id)->where("product_id",$request->product_id)->first();
        if($review_to_prove){
            $review_to_prove->product_id = $request->input("product_id");
            $review_to_prove->user_id = $request->user()->id;
            $review_to_prove->star = $request->input("star");
            $review_to_prove->content = $request->input("content");
            $review_to_prove->save();
            if($request->has("review_images")){
                if (Storage::exists("images/review_to_prove/$review_to_prove->id")){
                    Storage::deleteDirectory("images/review_to_prove/$review_to_prove->id");
                }
                foreach($request->file("review_images") as $file){
                    $file->store("images/review_to_prove/$review_to_prove->id");
                }
            }else{
                if (Storage::exists("images/review_to_prove/$review_to_prove->id")){
                    Storage::deleteDirectory("images/review_to_prove/$review_to_prove->id");
                } 
            }
        }else{
            $review_to_prove = new ReviewProve();
            $review_to_prove->product_id = $request->input("product_id");
            $review_to_prove->user_id = $request->user()->id;
            $review_to_prove->star = $request->input("star");
            $review_to_prove->content = $request->input("content");
            $review_to_prove->save();
            if($request->has("review_images")){
                foreach($request->file("review_images") as $file){
                    $file->store("images/review_to_prove/$review_to_prove->id");
                }
            }
        }
        
        return response()->json(['message'=>'Ok...'],200);
    }

    /**
     * Display the specified resource.
     */
    public function show(ReviewProve $reviewProve)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, ReviewProve $reviewProve)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(Request $request,ReviewProve $reviews_to_prove)
    {
        if (!Gate::forUser($request->user())->allows('manager-action')) {
            return response()->json(["message"=>"Bạn không phải là manager, bạn không có quyền này ?"],403);
        }
        if (Storage::exists("images/review_to_prove/$reviews_to_prove->id")){
                Storage::deleteDirectory("images/review_to_prove/$reviews_to_prove->id");
        } 
        $reviews_to_prove->delete();
        return response()->json(["message"=>"Ok..."]);
    }
}
