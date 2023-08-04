<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Http\Response;
use App\Models\User;
use App\Models\Admin;
use App\Models\Product;
use App\Models\FlashSale;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Auth;
use App\Models\ShoppingCart;
use Illuminate\Support\Facades\DB;
use App\Notifications\SMSNotification;
use Illuminate\Support\Facades\Notification;

class AuthController extends Controller
{
    // public function register(Request $request)
    // {
    //    Notification::route('mail', 'taylor@example.com')
    //         ->route('vonage', '0943166208')
    //         ->notify(new SMSNotification());
    //     return "message sent";    
    //      $validated = $request->validate([
    //       'phone'=>'required|min:6'
    //      ]);
    //     // Hash::make($request->input("password"))
    //     User::create([
    //         "phone"=> $request->phone
    //     ]);
    //     return response()->json(["message"=>"user created successfully"]);
    // }

    // public function login(Request $request)
    // {
    //      $credentials = $request->validate([
    //         'login_key' => 'required',
    //         'password' => 'required',
    //     ]);
 
    //     if (Auth::attempt($credentials)) {
    //         $request->session()->regenerate();
    //         return $this->show($request);
    //     }
 
    //     return response()->json(["message"=>"password or email invalid"],401);
       
    // }

    public function logout(Request $request)
    {
      $request->user()->tokens()->delete();

      return response()->json(["message"=>"logged out"],200);
    }

    public function show(Request $request)
    {
      $user = $request->user();
      $user->profile = DB::table("profiles")->where("user_id",$user->id)->first();
      $shopping_cart = $user->shopping_cart->map(function($item){
        $product = Product::find($item->product_id);
        $item->name = $product->name;
        $item->slug = $product->slug;
        $item->price = $product->price;
        $item->discounted_price = $product->discounted_price;
        $item->color = DB::table("product_colors")->where("id",$item->color_id)->value("color_name");
        $flash_sale = FlashSale::where("product_id",$product->id)->first();
        if($flash_sale){
          if($flash_sale->start_time < date('Y-m-d H:i:s') && date('Y-m-d H:i:s') < $flash_sale->end_time){
            $item->discounted_price = $flash_sale->discounted_price;
          }
        }
        $options = array();
        $options['colors'] = DB::table("product_colors")->select(['id','color','color_name'])->where("product_id",$item->product_id)->get();
        $group = DB::table("groups_products_link")->where("product_id",$item->product_id)->first();
        if($group){
          $product = Product::find($item->product_id);
          $product->group_id = $group->group_id;
          $options['versions'] = $product->products_in_group()->map(function($Item){
            $Item->colors = DB::table("product_colors")->select(['id','color','color_name'])->where("product_id",$Item->product_id)->get();
            return $Item;
          });
        } 
        if(count($options['colors']) !== 0){
          $item['options'] = $options;
        }
        return $item;
        });
        return response()->json(['user'=>$user,'type'=>$request->user()->tokenable_type,'shopping_cart'=>$shopping_cart],200);
    }

}
