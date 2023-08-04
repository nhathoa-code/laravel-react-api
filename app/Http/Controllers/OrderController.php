<?php

namespace App\Http\Controllers;

use App\Models\Order;
use App\Models\User;
use App\Models\Coupon;
use App\Models\Product;
use App\Models\FlashSale;
use App\Models\OrderTracker;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use App\Models\ShoppingCart;
use App\Notifications\OrderUpdated;
use App\Events\OrderPlaced;
use App\Events\OrderStatusUpdate;
use Illuminate\Support\Facades\Storage;

class OrderController extends Controller
{
    public function __construct()
    {
        $this->middleware('auth:sanctum');
    }
    /**
     * Display a listing of the resource.
     */
    public function index(Request $request)
    {
        if($request->has("status")){
            $result = array();
            if($request->has("admin")){
                 if($request->has("status")){
                    if($request->input("status") == 0){
                        $orders = Order::all();
                    }else{
                        $orders = Order::where("admin_status",$request->query("status"))->get();
                    }
                }
                $orders->each(function($item) use(&$result){
                    $result[] = array("order"=>$item,"order_details"=>DB::table("order_details")->select("products.name","order_details.*")->join("products","order_details.product_id","=","products.id")->where("order_id",$item->id)->get());
                });
            }else{
                if($request->has("status")){
                    if($request->input("status") === "0"){
                        $orders = Order::where("user_id",$request->user()->id)->orderBy("id","desc")->get();
                    }else{
                        $orders = Order::where("user_id",$request->user()->id)->where("status",$request->query("status"))->orderBy("id","desc")->get();
                    }
                }
                $orders->each(function($item) use(&$result){
                    $result[] = array("order"=>$item,"order_details"=>DB::table("order_details")->select("products.name","order_details.*","product_colors.color_name as color")->join("products","order_details.product_id","=","products.id")->join("product_colors","order_details.color_id","=","product_colors.id")->where("order_id",$item->id)->get());
                });
            }
           
            return $result;
        }
        return Order::all();
    }


    public function newOrders()
    {
        return Order::where("status",1)->orWhere("status",2)->where("pttt","vnpay")->get();
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {
        $items_to_purchase = $request->input("items_to_purchase");
        $address = json_decode($request->input("buyer_info"));
        $order = new Order();
        $coupons = array();
        $order->user_id = $request->user()->id;
        $order->buyer_info = $request->input("buyer_info");
        $order->status = 1;
        $order->admin_status = 1;
        $order->paid_status = "Chưa thanh toán";
        $order->shipping_fee = $request->input("shipping_fee");
        $order->pttt = $request->input("pttt");
        $order->note = $request->input("note");
        if($request->has("coupon")){
            $coupons['coupon'] = $request->input("coupon");
            $coupon = Coupon::find($request->input("coupon")["id"]);
            if(!$coupon){
                return response()->json(["message"=>"Mã giảm giá không tồn tại"],400);
            }
            if($coupon->used >= $coupon->limit_per_coupon){
                return response()->json(["message"=>"Mã giảm giá không hợp lệ"],400);
            }
            if(array_key_exists($request->user()->id,array_count_values(json_decode($coupon->users))) && array_count_values(json_decode($coupon->users))[$request->user()->id] >= $coupon->limit_per_user){
                return response()->json(["message"=>"Mã giảm giá không hợp lệ"],400);
            }
            $coupon->used = $coupon->used + 1;
            $users = json_decode($coupon->users);
            $users[] = $request->user()->id;
            $coupon->users = json_encode($users);
            $coupon->save();
        }
        if($request->has("free_ship")){
            $coupons['free_ship'] = $request->input("free_ship");
            $coupon = Coupon::find($request->input("free_ship")["id"]);
            if(!$coupon){
                return response()->json(["message"=>"Mã free ship không tồn tại"],400);
            }
            if($coupon->used >= $coupon->limit_per_coupon){
                return response()->json(["message"=>"Mã giảm giá không hợp lệ"],400);
            }
            if(array_key_exists($request->user()->id,array_count_values(json_decode($coupon->users))) && array_count_values(json_decode($coupon->users))[$request->user()->id] >= $coupon->limit_per_user){
                return response()->json(["message"=>"Mã giảm giá không hợp lệ"],400);
            }
            $coupon->used = $coupon->used + 1;
            $users = json_decode($coupon->users);
            $users[] = $request->user()->id;
            $coupon->users = json_encode($users);
            $coupon->save();
        }
        if(!empty($coupons)){
            $order->coupons = json_encode($coupons);
        }
        $order->save();
        OrderPlaced::dispatch($order);       
        $amount = 0;
        $shopping_cart = DB::table("shopping_cart")->where("user_id",$request->user()->id)->get();
        $shopping_cart->map(function($item) use($order,&$amount,$items_to_purchase){
            $product = Product::find($item->product_id);
            $flash_sale = FlashSale::where("product_id",$item->product_id)->first();
            if($flash_sale){
                if($flash_sale->start_time < date('Y-m-d H:i:s') && date('Y-m-d H:i:s') < $flash_sale->end_time){
                    $product->discounted_price = $flash_sale->discounted_price;
                }
            }
            if(in_array($item->id,$items_to_purchase)){
                $product = Product::find($item->product_id);
                $amount += $item->quantity * ($product->price - $product->discounted_price);
                $image_name = explode("/",$item->image)[count(explode("/",$item->image)) - 1];
                Storage::move($item->image, "images/orders/$order->id/$image_name");
                DB::table("order_details")->insert([
                    'order_id'=>$order->id,
                    'product_id'=>$item->product_id,
                    'price'=>$product->price,
                    'discounted_price'=>$product->discounted_price,
                    'quantity'=>$item->quantity,
                    'image'=> "images/orders/$order->id/$image_name",
                    'color_id'=>$item->color_id,
                    'version'=>$item->version,
                ]);
            }
        });
        foreach($items_to_purchase as $item_id){
            ShoppingCart::where("user_id",$request->user()->id)->where("id",$item_id)->delete();
        }
        $order->subtotal = $amount;
        $amount_pay = $amount + $order->shipping_fee;
        if($request->has("free_ship")){
            if($request->input("free_ship")["type"] === "fixed"){
                $amount_pay -= $request->input("free_ship")["amount"];
            }else if($request->input("free_ship")["type"] === "percent"){
                if($order->shipping_fee * ($request->input("free_ship")["amount"] / 100) > $request->input("free_ship")["maximum_discount"]){
                    $amount_pay -= $request->input("free_ship")["maximum_discount"];
                }else{
                    $amount_pay -= $order->shipping_fee * ($request->input("free_ship")["amount"] / 100);
                } 
            }else{
                $amount_pay -= $order->shipping_fee;
            }
        }

        if($request->has("coupon")){
            if($request->input("coupon")["type"] === "fixed"){
                $amount_pay -= $request->input("coupon")["amount"];
            }else{
                if(($amount * ($request->input("coupon")["amount"] / 100)) > $request->input("coupon")["maximum_discount"]){
                    $amount_pay -= $request->input("coupon")["maximum_discount"];
                }else{
                    $amount_pay -= $amount * ($request->input("coupon") / 100);
                }
            }
        }
        if($amount_pay < 0){
            $amount_pay = 0;
        }
        $order->amount_pay = $amount_pay;
        $order->save();
        if($order->pttt === "vnpay"){
            date_default_timezone_set('Asia/Ho_Chi_Minh');
            $vnp_TmnCode = "W4BLI9NI";
            $vnp_HashSecret = "AJQWNOVGZEXBFIVUMUJUAIFNBJZIHPTL";
            $vnp_Url = "https://sandbox.vnpayment.vn/paymentv2/vpcpay.html";
            $vnp_Returnurl = $request->input("return_url");
            $startTime = date("YmdHis");
            $expire = date('YmdHis', strtotime('+3 days', strtotime($startTime)));
            $vnp_TxnRef = $order->id;
            $vnp_Amount = $amount;
            $vnp_IpAddr = $_SERVER['REMOTE_ADDR'];

            $inputData = array(
                "vnp_Version" => "2.1.0",
                "vnp_TmnCode" => $vnp_TmnCode,
                "vnp_Amount" => $amount_pay * 100,
                "vnp_Command" => "pay",
                "vnp_CreateDate" => date('YmdHis'),
                "vnp_CurrCode" => "VND",
                "vnp_IpAddr" => $vnp_IpAddr,
                "vnp_Locale" => 'vn',
                "vnp_OrderInfo" => "Thanh toan GD:" . $vnp_TxnRef,
                "vnp_OrderType" => "other",
                "vnp_ReturnUrl" => $vnp_Returnurl,
                "vnp_TxnRef" => $vnp_TxnRef,
                "vnp_ExpireDate"=>$expire
            );
            if (isset($vnp_BankCode) && $vnp_BankCode != "") {
                $inputData['vnp_BankCode'] = $vnp_BankCode;
            }
            ksort($inputData);
            $query = "";
            $i = 0;
            $hashdata = "";
            foreach ($inputData as $key => $value) {
                if ($i == 1) {
                    $hashdata .= '&' . urlencode($key) . "=" . urlencode($value);
                } else {
                    $hashdata .= urlencode($key) . "=" . urlencode($value);
                    $i = 1;
                }
                $query .= urlencode($key) . "=" . urlencode($value) . '&';
            }
            $vnp_Url = $vnp_Url . "?" . $query;
            if (isset($vnp_HashSecret)) {
                $vnpSecureHash =   hash_hmac('sha512', $hashdata, $vnp_HashSecret);//  
                $vnp_Url .= 'vnp_SecureHash=' . $vnpSecureHash;
            }
            $order->repay_link = $vnp_Url;
            $order->save();
            return $vnp_Url;
        }else{
            return response()->json(['message'=>'Ok...','order_id'=>$order->id],200);
        }
    }

    /**
     * Display the specified resource.
     */
    public function show(Order $order)
    {
        return response()->json(["order"=>$order,"order_details"=>DB::table("order_details")->select("products.name","order_details.*","product_colors.color_name as color")->join("products","order_details.product_id","=","products.id")->join("product_colors","order_details.color_id","=","product_colors.id")->where("order_id",$order->id)->get(),"order_tracker"=>OrderTracker::where("order_id",$order->id)->get()],200);
    }


    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, Order $order)
    {
        if($request->has("order_details")){
            $order_details = json_decode($request->input("order_details"));
            foreach($order_details as $item){
                DB::table("order_details")->where("id",$item->id)->update(['quantity'=>$item->quantity,'discounted_price'=>$item->discounted_price]);
            }
            $order->save();
            User::find($request->input("user_id"))->notify(new OrderUpdated());
            return response()->json(['message'=>"Ok..."],200);
        }else if($request->has("status_code")){
            switch($request->input("status_code")){
                case "2": 
                    $order->status = $request->input("status_code");
                    $order->admin_status = $request->input("status_code");
                    OrderStatusUpdate::dispatch($order->id,"Đơn hàng đã được xác nhận");
                    break;
                case "3":
                    $order->status = $request->input("status_code");
                    $order->admin_status = $request->input("status_code"); 
                    OrderStatusUpdate::dispatch($order->id,"Đơn hàng đang được giao đến bạn");    
                    break;
                case "4":
                    $order->status = $request->input("status_code");
                    $order->admin_status = 5;
                    if($order->pttt === "cod"){
                        $order->paid_status = "Đã thanh toán";
                    }
                    OrderStatusUpdate::dispatch($order->id,"Đơn hàng đã được giao thành công"); 
                    DB::table("order_details")->where("order_id",$order->id)->get()->map(function($item){
                        $product = Product::find($item->product_id);
                        $product->sold = $product->sold + $item->quantity;
                        $product->save();
                        $inventory = DB::table("inventory")->where("product_id",$item->product_id);
                        if($item->color_id){
                            $inventory->where("color_id",$item->color_id);
                        }
                        $inventory->decrement("quantity",$item->quantity);
                    });
                    break;
                case "6":
                    $order->admin_status = $request->input("status_code"); 
                    break;
                case "7":
                    $order->admin_status = 7;
                    $order->status = 7;
                    $order->canceled_by = "1";
                    OrderStatusUpdate::dispatch($order->id,"Đơn hàng đã bị hủy");            
            }
            $order->save();
            return response()->json(['message'=>"Ok...",'status'=>$order->admin_status,'pttt'=>$order->pttt],200);
        }else if($request->has("order_cancel")){
            $order->status = 7;
            $order->admin_status = 7;
            $order->canceled_by = $request->canceled_by;
            $order->save();
            OrderStatusUpdate::dispatch($order->id,"Đơn hàng đã bị hủy");
            return response()->json(['message'=>"Ok..."],200);
        }
       
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(Order $order)
    {
        //
    }

    public function countOrders(Request $request)
    {
        $status_1 = Order::where("user_id",$request->user()->id)->where("status",1)->count();
        $status_2 = Order::where("user_id",$request->user()->id)->where("status",2)->count();
        $status_3 = Order::where("user_id",$request->user()->id)->where("status",3)->count();
        return array("status_1"=>$status_1,"status_2"=>$status_2,"status_3"=>$status_3);
    }
}
