<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class ProductsGroup extends Model
{
    use HasFactory;
    public $timestamps = false;
    protected $table = 'products_groups';
    protected $fillable = ['name','category_id','brand_id'];
}
