<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Review extends Model
{
    use HasFactory;
    public $timestamps = false;
     protected $casts = [
        'created_at' => 'datetime:d-m-Y H:i:s',
    ];
}
