<?php

namespace App\Http\Controllers;
use Illuminate\Support\Facades\DB;

use Illuminate\Http\Request;
use App\Models\User;
use App\Models\Order;

class CustomerController extends Controller
{
    public function index()
    {
        return User::all()->map(function($user){
            $user->profile = DB::table("profiles")->where("user_id",$user->id)->first();
            return $user;
        });
    }

    public function customer(Request $request,User $customer)
    {
        $customer->user_addresses;
        $customer->user_orders;
        return $customer;
    }
}
