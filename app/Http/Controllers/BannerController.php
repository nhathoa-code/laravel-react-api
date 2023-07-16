<?php

namespace App\Http\Controllers;

use App\Models\Banner;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Storage;

class BannerController extends Controller
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
        return Banner::all();
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {
        $banner = new Banner();
        $banner->image = $request->file("banner_image")->store("images/banners");
        $banner->short_description = $request->short_description;
        $banner->link_to = $request->link_to;
        $banner->save();
        return $banner;
    }

    /**
     * Display the specified resource.
     */
    public function show(Banner $banner)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, Banner $banner)
    {
        if($request->has("banner_image")){
            Storage::delete($banner->image);
            $banner->image = $request->file("banner_image")->store("images/banners");
        }
        $banner->short_description = $request->short_description;
        $banner->link_to = $request->link_to;
        $banner->save();
        return $banner;
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(Banner $banner)
    {
        Storage::delete($banner->image);
        $banner->delete();
        return response()->json(["message"=>"delete ok"],200);
    }
}
