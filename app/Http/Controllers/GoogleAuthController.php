<?php

namespace App\Http\Controllers;
use Laravel\Socialite\Facades\Socialite;
use App\Models\User;
use App\Http\Controllers\AuthController;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;
use Illuminate\Http\Request;

class GoogleAuthController extends Controller
{
    public function authRedirect(Request $request)
    {
        return Socialite::driver('google')->redirect()->getTargetUrl();
    }

    public function authCallback(Request $request)
    {
        $googleUser = Socialite::driver('google')->user();
        $user = User::where("social_id",$googleUser->id)->where("driver","google")->first();
        if($user){
            Auth::login($user,true);
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
            Auth::login($user,true);
        }
        $authController = new AuthController();
        return $authController->show($request);
      
      // var_dump($googleUser);
    }
}
