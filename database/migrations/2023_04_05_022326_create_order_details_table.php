<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up(): void
    {
        Schema::create('order_details', function (Blueprint $table) {
            $table->id();
            $table->unsignedBigInteger('order_id');
            $table->foreign("order_id")->references("id")->on("orders")->onDelete('cascade')->onUpdate('cascade');
            $table->unsignedBigInteger('product_id');
            $table->foreign("product_id")->references("id")->on("products")->onDelete('cascade')->onUpdate('cascade');
            $table->bigInteger("price")->unsigned();
            $table->bigInteger("discounted_price")->unsigned();
            $table->integer("quantity");
            $table->text("image");
            $table->unsignedBigInteger('color_id');
            $table->foreign("color_id")->references("id")->on("product_colors")->onDelete('cascade')->onUpdate('cascade');
            $table->string("version",50);
            $table->timestamp('created_at');
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('order_details');
    }
};
