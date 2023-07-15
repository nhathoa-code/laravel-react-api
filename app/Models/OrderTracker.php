<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class OrderTracker extends Model
{
    use HasFactory;
    public $timestamps = false;
    protected $table = 'order_tracker';
    protected $casts = [
        'created_at' => 'datetime:d-m-Y H:i:s',
    ];
}
