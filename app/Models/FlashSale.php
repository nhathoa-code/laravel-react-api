<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class FlashSale extends Model
{
    use HasFactory;
    protected $table = 'flash_sale';
    public $timestamps = false;
    protected $fillable = ['product_id', 'discounted_price', 'start_time', 'end_time'];
}
