<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\HasMany;
use Illuminate\Support\Facades\DB;

class Product extends Model
{
    use HasFactory;
    public $timestamps = false;

    public function categories():HasMany
    {
        return $this->hasMany(ProductCategories::class);
    }

    public function products_in_group()
    {
        return DB::table("groups_products_link")->join("products","products.id","=","groups_products_link.product_id")->where("group_id",$this->group_id)->select("products.id AS product_id","products.name","products.slug","products.price","products.discounted_price","groups_products_link.version_name")->get();
    }
}
