<?php

namespace App\Http\Controllers;
use Laravel\Socialite\Facades\Socialite;
use App\Models\User;
use App\Http\Controllers\AuthController;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;
use Illuminate\Http\Request;
use Illuminate\Http\Response;

class GoogleAuthController extends Controller
{
    public function authRedirect(Request $request)
    {
        return Socialite::driver('google')->stateless()->redirect()->getTargetUrl();
    }

    public function authCallback(Request $request,Response $response)
    {
        $googleUser = Socialite::driver('google')->stateless()->user();
        $user = User::where("social_id",$googleUser->id)->where("driver","google")->first();
      
        if($user){
            $token = $user->createToken('authToken')->plainTextToken;
        }else{
            $user = new User();
            $user->login_key = $googleUser->email;
            $user->social_id = $googleUser->id;
            $user->driver = "google";
            $user->save();
            DB::table('profiles')->insert([
                'user_id'=>$user->id,
                'nickname'=>$googleUser->nickname,
                'name'=>$googleUser->name,
                'email'=>$googleUser->email
            ]);
            // Auth::login($user,true);
            $token = $user->createToken('authToken')->plainTextToken;
        }
            

            $authController = new AuthController();
        // return $request->user();
        // return $authController->show($request);
      
      // var_dump($googleUser);
      $user->profile = DB::table("profiles")->where("user_id",$user->id)->first();
      $shopping_cart = $user->shopping_cart->map(function($item){
        $options = array();
        $options['colors'] = DB::table("product_colors")->select(['color','color_name'])->where("product_id",$item->product_id)->get();
        $group = DB::table("groups_products_link")->where("product_id",$item->product_id)->first();
        if($group){
          $product = Product::find($item->product_id);
          $product->group_id = $group->group_id;
          $options['versions'] = $product->products_in_group()->map(function($Item){
            $Item->colors = DB::table("product_colors")->select(['color','color_name'])->where("product_id",$Item->product_id)->get();
            return $Item;
          });
        } 
        if(count($options['colors']) !== 0){
          $item['options'] = $options;
        }
        return $item;
       });
       return response()->json(['auth_token'=>$token,'user'=>$user,'shopping_cart'=>$shopping_cart],200);
    }
}
