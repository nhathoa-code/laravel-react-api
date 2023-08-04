<?php

use Illuminate\Support\Facades\Route;
use App\Models\Product;
use Illuminate\Support\Facades\DB;


/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider and all of them will
| be assigned to the "web" middleware group. Make something great!
|
*/

Route::get('/', function () {
    return view('welcome');
});

Route::get('/seed',function(){
    $products = Product::all();
    foreach ($products as $product) {
        $colors = DB::table("product_colors")->where("product_id",$product->id)->get();
        if($colors->count() > 0){
            foreach ($colors as $color){
                DB::table("inventory")->insert([
                    "product_id"=>$product->id,
                    "color_id"=>$color->id,
                    "quantity"=>100
                ]);
            }
        }else{
            DB::table("inventory")->insert([
                "product_id"=>$product->id,
                "quantity"=>100
            ]);
        }
    }
    return "ok...";
});