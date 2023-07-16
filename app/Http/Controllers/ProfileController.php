<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;

class ProfileController extends Controller
{
    public function __construct()
    {
        $this->middleware('auth:sanctum');
    }
    
    public function index()
    {
        $profile = DB::table("profiles")->where("user_id",Auth::user()->id)->first();
        $profile->birthday = date_format(date_create($profile->birthday), 'd-m-Y');
        return $profile;
    }

    public function update(Request $request)
    {
        DB::table("profiles")->where("user_id",$request->user()->id)->update([
            "nickname"=>$request->nickname,
            "name"=>$request->name,
            "gender"=>$request->gender,
            "birthday"=>$request->birth_day
        ]);
        return response()->json(["message"=>"Ok..."]);
    }
}
