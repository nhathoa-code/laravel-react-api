<?php

namespace App\Http\Controllers;

use App\Models\Coupon;
use Illuminate\Http\Request;

class CouponController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        return Coupon::all()->map(function($item){
            $item->start = date_format(date_create($item->start), 'd-m-Y');
            $item->end = date_format(date_create($item->end), 'd-m-Y');
            return $item;
        });
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {
        // return $request->all();
        $coupon = new Coupon();
        $coupon->code = $request->code;
        $coupon->description = $request->description;
        $coupon->start = $request->start;
        $coupon->end = $request->end;
        $coupon->coupon_type = $request->coupon_type;
        $coupon->type = $request->type;
        if($request->has("amount")){
            $coupon->amount = str_replace('.', '', $request->amount);
        }else{
            $coupon->amount = 0;
        }
     
        if($request->has("maximum_discount")){
            $coupon->maximum_discount = str_replace('.', '', $request->maximum_discount);
        }
        $coupon->minimum_spend = str_replace('.', '', $request->minimum_spend);
        $coupon->limit_per_coupon = $request->limit_per_coupon;
        $coupon->limit_per_user = $request->limit_per_user;
        if($request->has("applied_products")){
            $coupon->applied_products = json_encode($request->applied_products);
        }
        $coupon->save();
        return response()->json(["message"=>"Thêm mã khuyến mãi thành công"],200);
        
    }

    /**
     * Display the specified resource.
     */
    public function show(Coupon $coupon)
    {
        return $coupon;
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, Coupon $coupon)
    {
        $coupon->code = $request->code;
        $coupon->description = $request->description;
        $coupon->start = $request->start;
        $coupon->end = $request->end;
        $coupon->coupon_type = $request->coupon_type;
        $coupon->type = $request->type;
        if($request->has("amount")){
            $coupon->amount = str_replace('.', '', $request->amount);
        }else{
            $coupon->amount = 0;
        }
        if($request->has("maximum_discount")){
            $coupon->maximum_discount = str_replace('.', '', $request->maximum_discount);
        }else{
            $coupon->maximum_discount = null;
        }
        $coupon->minimum_spend = str_replace('.', '', $request->minimum_spend);
        $coupon->limit_per_coupon = $request->limit_per_coupon;
        $coupon->limit_per_user = $request->limit_per_user;
        if($request->has("applied_products")){
            $coupon->applied_products = json_encode($request->applied_products);
        }
        $coupon->save();
        return response()->json(["message"=>"Đã cập nhật mã khuyến mãi"],200);
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(Coupon $coupon)
    {
        $coupon->delete();
        return response()->json(["message"=>"Đã xóa mã khuyến mãi"],200);
    }
}
