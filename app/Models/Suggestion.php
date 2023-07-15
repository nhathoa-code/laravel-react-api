<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Suggestion extends Model
{
    use HasFactory;
    protected $table = 'suggestion';
    public $timestamps = false;
    protected $fillable = ['product_id', 'suggestion_product_id'];
}
