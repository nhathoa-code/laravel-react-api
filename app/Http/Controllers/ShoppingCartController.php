<?php

namespace App\Http\Controllers;

use App\Models\ShoppingCart;
use App\Models\Product;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Storage;
use Illuminate\Support\Facades\DB;

class ShoppingCartController extends Controller
{


    public function __construct()
    {
        $this->middleware('auth:sanctum');
    }

    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        //
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {
        $user_id = $request->user()->id;
        $shopping_cart_item= ShoppingCart::where('user_id', '=', $user_id)->where('product_id','=',$request->input("product_id"))->where('color','=',$request->has("color") ? $request->input("color") : "")->where('version','=',$request->has('version') ? $request->input('version') : "")->first();
        if ($shopping_cart_item === null) {
            $shopping_cart_item = new ShoppingCart();
            $shopping_cart_item->user_id = $user_id;
            $shopping_cart_item->product_id = $request->input("product_id");
            $shopping_cart_item->name = $request->input("name");
            $shopping_cart_item->slug = $request->input("slug");
            $str_arr = explode("/",$request->input("image"));
            $file_name = end($str_arr);
            $shopping_cart_item->price = $request->input("price");
            $shopping_cart_item->discounted_price = $request->input("discounted_price");
            $shopping_cart_item->image = "images/shopping_cart/$user_id/$file_name";
            Storage::copy($request->input("image"), "images/shopping_cart/$user_id/$file_name");
            $options = array();
            if($request->has("color")){
                $shopping_cart_item->color = $request->input("color");
                $options['colors'] = DB::table("product_colors")->select(['color','color_name'])->where("product_id",$request->input("product_id"))->get();
            }
            if($request->has("version")){
                $shopping_cart_item->version = $request->input("version");
                $product = Product::find($request->input("product_id"));
                $group = DB::table("groups_products_link")->where("product_id",$request->input("product_id"))->first();
                $product->group_id = $group->group_id;
                $options['versions'] = $product->products_in_group()->map(function($Item){
                $Item->colors = DB::table("product_colors")->select(['color','color_name'])->where("product_id",$Item->product_id)->get();
                return $Item;
            });
             
            }
            $shopping_cart_item->quantity = 1;
            $shopping_cart_item->save();
            $res = array("cart_item"=>$shopping_cart_item,"new"=>true);
            if(!empty($options)){
                $res["options"] = $options;
            }
            return response()->json($res,200);
        }else{
            $shopping_cart_item->quantity = $shopping_cart_item->quantity + 1;
            $shopping_cart_item->save();
            return response()->json(["cart_item"=>$shopping_cart_item,"new"=>false],200);
        }
    }

    /**
     * Display the specified resource.
     */
    public function show(ShoppingCart $shoppingCart)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, ShoppingCart $shoppingCart)
    {
        if($request->has("update")){
            if($request->has("version")){
                $shoppingCart->color = $request->input("color");
                $shoppingCart->image = $request->input("image");
                $shoppingCart->version = $request->input("version");
                $shoppingCart->product_id = $request->input("product_id");
                $shoppingCart->name = $request->input("name");
                $shoppingCart->slug = $request->input("slug");
                $shoppingCart->price = $request->input("price");
                $shoppingCart->discounted_price = $request->input("discounted_price");
                if($request->has("quantity")){
                    $shoppingCart->quantity = $request->input("quantity");
                }
                $shoppingCart->save();
            }else{
                $shoppingCart->color = $request->input("color");
                $shoppingCart->image = $request->input("image");
                $shoppingCart->save();
            }
          
            return "update color...";
        }else{
            switch($request->input("action")){
                case "+":
                    $shoppingCart->quantity = $shoppingCart->quantity + 1;
                    $shoppingCart->save();
                    break;
                case "-":
                    $shoppingCart->quantity = $shoppingCart->quantity - 1;
                    $shoppingCart->save();
                    break;
            };
            return "OK...";
        }
     
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(ShoppingCart $shoppingCart)
    {
        Storage::delete($shoppingCart->image);
        $shoppingCart->delete();
        return response()->json(['message'=>'cart item deleted successfully'],200);
    }


    public function deleteItems(Request $request)
    {
        $items_to_delete = $request->input("items_to_delete");
        foreach($items_to_delete as $item_id){
            // ShoppingCart::where("user_id",$request->user()->id)->where("id",$item_id)->delete();
            $cart_item = ShoppingCart::where("user_id",$request->user()->id)->where("id",$item_id)->first();
            Storage::delete($cart_item->image);
            $cart_item->delete();
        }
        return response()->json(['message'=>"Ok..."],200);
    }
}
