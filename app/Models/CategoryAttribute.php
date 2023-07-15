<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class CategoryAttribute extends Model
{
    use HasFactory;
    protected $table = 'category_attributes';
    public $timestamps = false;
    protected $fillable = ['name', 'category_id','show/hide'];
}
