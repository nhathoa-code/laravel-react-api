<?php

namespace App\Http\Controllers;

use App\Models\FlashSale;
use App\Models\Review;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Gate;

class FlashSaleController extends Controller
{
    public function __construct()
    {
        $this->middleware('auth:sanctum')->only('store');
    }
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        return DB::table("flash_sale")->join("products","products.id","=","flash_sale.product_id")->select("products.id","products.image","products.name","products.slug","products.price","flash_sale.discounted_price","flash_sale.start_time","flash_sale.end_time")->get()->map(function($product){
            $product->reviews = array("average_star"=> (float)Review::where("product_id",$product->id)->avg("star"),"total_reviews"=>Review::where("product_id",$product->id)->count());
            return $product;
        });
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {
        if (!Gate::forUser($request->user())->allows('manager-action')) {
            return response()->json(["message"=>"Bạn không phải là manager, bạn không có quyền này ?"],403);
        }
        $product_ids_from_db = FlashSale::all()->pluck("product_id")->toArray();
        $flash_saled_product_ids = json_decode($request->product_ids);
        $fullDiff_product_ids = array_merge(array_diff($flash_saled_product_ids, $product_ids_from_db), array_diff($product_ids_from_db, $flash_saled_product_ids));
        foreach ($fullDiff_product_ids as $id) {
            if (in_array($id, $product_ids_from_db)) {
                FlashSale::where("product_id",$id)->delete();
            } else {
                FlashSale::create([
                    "product_id"=>$id,
                    "discounted_price"=>str_replace('.', '', $request->input("discounted_price_$id")),
                    "start_time"=>$request->input("start_time"),
                    "end_time"=>$request->input("end_time"),
                ]);
            }
        }
        /**
         * update remaining flash saled products
         */
        $remaining_flash_saled_product_ids = array_diff($flash_saled_product_ids,$fullDiff_product_ids);
        foreach($remaining_flash_saled_product_ids as $flash_saled_product_id){
            $flash_saled_product = FlashSale::where("product_id",$flash_saled_product_id)->first();
            if($flash_saled_product->discounted_price != $request->input("discounted_price_$flash_saled_product_id")){
                $flash_saled_product->discounted_price = str_replace('.', '', $request->input("discounted_price_$flash_saled_product_id"));
                $flash_saled_product->start_time = $request->input("start_time");
                $flash_saled_product->end_time = $request->input("end_time");
                $flash_saled_product->save();
            }
        }
        return response()->json(["message"=>"Tạo flash sale thành công"],200);
    }

    /**
     * Display the specified resource.
     */
    public function show(FlashSale $flashSale)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, FlashSale $flashSale)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(FlashSale $flashSale)
    {
        //
    }
}
