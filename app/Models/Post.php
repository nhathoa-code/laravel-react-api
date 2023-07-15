<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;

class Post extends Model
{
    use HasFactory;
    protected $fillable = ['title','slug','description','content','author_id', 'product_id','post_category_id', 'post_thumbnail', 'images'];
    protected $casts = [
        'created_at' => 'datetime:d-m-Y',
    ];
    public function post_category(): BelongsTo
    {
        return $this->belongsTo(PostCategory::class);
    } 

    public function author(): BelongsTo
    {
        return $this->belongsTo(Admin::class);
    }
}
