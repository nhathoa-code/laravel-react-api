<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class CommentReply extends Model
{
    use HasFactory;
    protected $table = 'comments_to_reply';
    public $timestamps = false;
    protected $casts = [
        'created_at' => 'datetime:d-m-Y H:i:s',
    ];
}
