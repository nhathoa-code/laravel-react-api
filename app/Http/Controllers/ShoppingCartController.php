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
        $shopping_cart_item= ShoppingCart::where('user_id', '=', $user_id)->where('product_id','=',$request->input("product_id"))->where('color_id','=',$request->has("color_id") ? $request->input("color_id") : null)->where('version','=',$request->has('version') ? $request->input('version') : null)->first();
        if ($shopping_cart_item === null) {
            $product = Product::find($request->input("product_id"));
            $shopping_cart_item = new ShoppingCart();
            $shopping_cart_item->user_id = $user_id;
            $shopping_cart_item->product_id = $request->input("product_id");
            $str_arr = explode("/",$request->input("image"));
            $file_name = end($str_arr);
            $shopping_cart_item->image = "images/shopping_cart/$user_id/$file_name";
            Storage::copy($request->input("image"), "images/shopping_cart/$user_id/$file_name");
            $options = array();
            if($request->has("color_id")){
                $shopping_cart_item->color_id = $request->input("color_id");
                $color_name = DB::table("product_colors")->where("id",$shopping_cart_item->color_id)->value("color_name");
                $options['colors'] = DB::table("product_colors")->select(['id','color','color_name'])->where("product_id",$request->input("product_id"))->get();
            }
            if($request->has("version")){
                $shopping_cart_item->version = $request->input("version");
                $group = DB::table("groups_products_link")->where("product_id",$request->input("product_id"))->first();
                $product->group_id = $group->group_id;
                $options['versions'] = $product->products_in_group()->map(function($Item){
                $Item->colors = DB::table("product_colors")->select(['id','color','color_name'])->where("product_id",$Item->product_id)->get();
                return $Item;
            });
             
            }
            $shopping_cart_item->quantity = 1;
            $shopping_cart_item->save();
            if(isset($shopping_cart_item->color_id)){
                $shopping_cart_item->color = $color_name;
            } 
            $res = array("cart_item"=>$shopping_cart_item,"product"=>$product,"new"=>true);
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
            Storage::delete($shoppingCart->image);
            $str_arr = explode("/",$request->input("image"));
            $file_name = end($str_arr);
            $shoppingCart->image = "images/shopping_cart/{$request->user()->id}/$file_name";
            Storage::copy($request->input("image"), "images/shopping_cart/{$request->user()->id}/$file_name");
           
            if($request->has("version")){
                $shoppingCart->color_id = $request->input("color_id");
                $shoppingCart->version = $request->input("version");
                $shoppingCart->product_id = $request->input("product_id");
                if($request->has("quantity")){
                    $shoppingCart->quantity = $request->input("quantity");
                }
                $shoppingCart->save();
            }else{
                $shoppingCart->color_id = $request->input("color_id");
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
            $cart_item = ShoppingCart::where("user_id",$request->user()->id)->where("id",$item_id)->first();
            Storage::delete($cart_item->image);
            $cart_item->delete();
        }
        return response()->json(['message'=>"Ok..."],200);
    }
}
