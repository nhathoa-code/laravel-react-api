<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class ReviewProve extends Model
{
    use HasFactory;
    public $timestamps = false;
    protected $table = "reviews_to_prove";
    protected $casts = [
        'created_at' => 'datetime:d-m-Y H:i:s',
    ];
}
