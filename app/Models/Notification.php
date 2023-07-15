<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Notification extends Model
{
    use HasFactory;
    public $timestamps = false;
    protected $table = 'notification';
    protected $casts = [
        'created_at' => 'datetime:d-m-Y H:i:s',
    ];
   
}
