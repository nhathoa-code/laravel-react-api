<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class CategoryAttributeValue extends Model
{
    use HasFactory;
    protected $table = 'category_attribute_values';
    public $timestamps = false;
    protected $fillable = ['value', 'category_attribute_id'];
}
