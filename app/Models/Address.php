<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Address extends Model
{
    use HasFactory;
    protected $table = 'address';
    public $timestamps = false;
    protected $fillable = ['user_id', 'full_name', 'phone_number', 'city','district','village','address','is_defaulted'];
}
