<?php

namespace App\Http\Controllers;

use App\Models\Admin;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Storage;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Gate;

class AdminController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        return Admin::all()->map(function($item){
            $item['roles'] = DB::table("admins_roles")->join("roles","roles.id","=","admins_roles.role_id")->where("admin_id",$item->id)->pluck('roles.name');
            return $item;
        });
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {
        if (!Gate::forUser(Auth::guard('admin')->user())->allows('admin-action')) {
            return response()->json(["message"=>"Bạn không phải là administrator, bạn không có quyền này ?"],403);
        }
        
        $admin = Admin::create([
            "name"=>$request->name,
            "username"=>$request->username,
            "password"=> Hash::make($request->password),
            "picture"=> $request->has("picture") ? $request->file("picture")->store("images/avatars") : null
        ]);
        foreach($request->roles as $role){
            DB::table("admins_roles")->insert([
                "admin_id"=>$admin->id,
                "role_id"=>$role,
            ]);
        };
        return response()->json(["message"=>"admin created successfully","new_admin"=>$admin]);
    }

    /**
     * Display the specified resource.
     */
    public function show()
    {
        if(Auth::guard('admin')->check()){
            $admin = Auth::guard('admin')->user()->load(['roles']);
            return response()->json(['admin'=> $admin,'is_admin'=>$admin->is_admin],200);
        }else{
            return response()->json(['message'=>'unauthorized'],401);
        }
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, Admin $admin)
    {
        if(Auth::guard('admin')->user()->is_admin){
            $admin->name = $request->name;
            $admin->username = $request->username;
            if($request->password){
                $admin->password = $request->password;
            }
            if($request->has("picture")){
                if($admin->picture){
                    Storage::delete($admin->picture);
                }
                $admin->picture = $request->file("picture")->store("images/avatars");
            }
            $admin->save();
            $roles = DB::table("admins_roles")->where("admin_id",$admin->id)->pluck("role_id")->toArray();
            $fullDiff_roles = array_merge(array_diff($request->roles, $roles), array_diff($roles, $request->roles));
            foreach ($fullDiff_roles as $item) {
                if (in_array($item, $roles)) {
                    DB::table("admins_roles")->where("admin_id",$admin->id)->delete();
                } else {
                    DB::table("admins_roles")->insert([
                    "admin_id"=>$admin->id,   
                    "role_id"=>$item,
                    ]);
                }
            }
            return response()->json(["message"=>"Cập nhật tài khoản quản trị thành công.","edited_admin"=>$admin]);
        }else{
            if(Auth::guard('admin')->user()->id === $admin->id){
                $admin->password = Hash::make($request->password);
                if($request->has("picture")){
                    if($admin->picture){
                        Storage::delete($admin->picture);
                        $admin->picture = $request->file("picture")->store("images/avatars");
                    }
                }
                $admin->save();
                return response()->json(["message"=>"Cập nhật tài khoản thành công."],200); 
            }else{
                return response()->json(["message"=>"Bạn không phải là administrator,Bạn không có quyền này."],403); 
            }
        }
    
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(Admin $admin)
    {
        if (!Gate::forUser(Auth::guard('admin')->user())->allows('admin-action')) {
            return response()->json(["message"=>"Bạn không phải là administrator, bạn không có quyền này ?"],403);
        }
        
        $admin->delete();
        return response()->json(["message"=>"admin edited successfully"]);
    }

    public function login(Request $request)
    {
        
         $credentials = $request->validate([
            'username' => 'required',
            'password' => 'required',
        ],[   
            'username.required' => 'Username không được để trống',
            'password.required' => 'Mật khẩu không được để trống'
        ]);
 
        if (Auth::guard('admin')->attempt($credentials,true)) {
            $request->session()->regenerate();
            return Auth::guard('admin')->user()->load(['roles']);
        }
        return response()->json(["message"=>"Username hoặc mật khẩu không đúng !"],401);
       
    }

    public function logout(Request $request)
    {
        Auth::guard('admin')->logout();
 
        $request->session()->invalidate();
 
        $request->session()->regenerateToken();

        return response()->json(["message"=>"logged out"],200);
    }



}
