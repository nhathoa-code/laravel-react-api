<?php

namespace App\Http\Controllers;

use App\Models\Review;
use App\Models\Product;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Storage;

class ReviewController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index(Request $request)
    {
        return Review::where("user_id",$request->user()->id)->latest()->get()->map(function($item){
            $item->product = Product::find($item->product_id);
            if(Storage::exists("images/review/$item->id")){
                $item->images = Storage::files("images/review/$item->id");
            }
            return $item;
        });
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {
        $review = new Review();
        $review->product_id = $request->input("product_id");
        $review->user_id = $request->user()->id;
        $review->star = $request->input("star");
        $review->content = $request->input("content");
        $review->save();
        if($request->has("review_images")){
            foreach($request->file("review_images") as $file){
                $file->store("images/review/$review->id");
            }
        }
        return response()->json(['message'=>'Ok...'],200);
    }

    /**
     * Display the specified resource.
     */
    public function show(Review $review)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, Review $review)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(Review $review)
    {
        //
    }
}
