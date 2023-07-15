<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Foundation\Auth\User as Authenticatable;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsToMany;
use Illuminate\Database\Eloquent\Casts\Attribute;


class Admin extends Authenticatable
{
    use HasFactory;
    public $timestamps = false;
    protected $fillable = ['name', 'username', 'password','picture'];
    protected $hidden = [
        'password',
        'remember_token',
    ];

    public function roles(): BelongsToMany
    {
        return $this->belongsToMany(Role::class,'admins_roles');
    }

    public function getIsAdminAttribute()
    {
        $roles = $this->roles->map(function($item){
            return strtolower($item->name);
        });
        return in_array('administrator',$roles->toArray());
    }

    public function getIsManagerAttribute()
    {
        $roles = $this->roles->map(function($item){
            return strtolower($item->name);
        });
        return in_array('manager',$roles->toArray());
    }

    public function getIsAuthorAttribute()
    {
        $roles = $this->roles->map(function($item){
            return strtolower($item->name);
        });
        return in_array('author',$roles->toArray());
    }

}
