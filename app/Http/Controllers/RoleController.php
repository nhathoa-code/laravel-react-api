<?php

namespace App\Http\Controllers;

use App\Models\Role;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Gate;
use Illuminate\Support\Facades\Auth;

class RoleController extends Controller
{
    public function __construct()
    {
        $this->middleware('auth:sanctum')->except('index');
    }
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        return Role::all();
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {
        if (!Gate::forUser(Auth::guard('admin')->user())->allows('admin-action')) {
            return response()->json(["message"=>"Bạn không phải là administrator, bạn không có quyền này ?"],403);
        }
        
        return Role::create([
            "name"=>$request->role_name,
            "description"=>$request->role_description,
        ]);
    }

    /**
     * Display the specified resource.
     */
    public function show(Role $role)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, Role $role)
    {
        if (!Gate::forUser(Auth::guard('admin')->user())->allows('admin-action')) {
            return response()->json(["message"=>"Bạn không phải là administrator, bạn không có quyền này ?"],403);
        }
        $role->name = $request->role_name;
        $role->description = $request->role_description;
        $role->save();
        return response()->json(['message'=>"role updated successfully",'edited_role'=>$role]);
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(Role $role)
    {
        if (!Gate::forUser(Auth::guard('admin')->user())->allows('admin-action')) {
            return response()->json(["message"=>"Bạn không phải là administrator, bạn không có quyền này ?"],403);
        }
        $role->delete();
        return response()->json(["message"=>"role deleted successfully"]);
    }
}
