<?php

namespace App\Http\Controllers;

use App\Models\Address;
use Illuminate\Http\Request;

class AddressController extends Controller
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
        return Address::where("user_id","=",$request->user()->id)->get();
    }


    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {
       
         try {
            if($request->input("default")){
                Address::where('user_id',$request->user()->id)->update(['is_defaulted'=>'0']);
            }
            return Address::create([
                'user_id' => $request->user()->id,
                'full_name' => $request->input("full_name"),
                'phone_number' => $request->input("phone_number"),
                'city' => $request->input("city"),
                'district' => $request->input("district"),
                'village' => $request->input("village"),
                'address' => $request->input("address"),
                'is_defaulted' => $request->input("default") ? '1' : '0',
            ]);
        } catch (\Exception $e) {
            return $e->getMessage();
        }
    }

    /**
     * Display the specified resource.
     */
    public function show(Address $address)
    {
        //
    }


    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, Address $address)
    {
        if($request->has("set_default")){
            Address::where('user_id',$request->user()->id)->update(['is_defaulted'=>'0']);
            $address->is_defaulted = '1';
            $address->save();
            return response()->json(['message'=>"Ok..."],200);
        }else{
            if($request->input("default")){
                Address::where('user_id',$request->user()->id)->update(['is_defaulted'=>'0']);
            }
            $address->full_name = $request->input("full_name");
            $address->phone_number = $request->input("phone_number");
            $address->city = $request->input("city");
            $address->district = $request->input("district");
            $address->village = $request->input("village");
            $address->address = $request->input("address");
            $address->is_defaulted = $request->input("default") ? '1' : '0';
            $address->save();
            return $address;
        }
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(Address $address)
    {
        $address->delete();
        return response()->json(['message'=>"Ok..."],200);
    }
}
