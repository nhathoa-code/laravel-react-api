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
        Schema::create('inventory', function (Blueprint $table) {
            $table->id();
            $table->unsignedBigInteger('product_id');
            $table->foreign("product_id")->references("id")->on("products")->onDelete('cascade')->onUpdate('cascade');
            $table->foreignId('color_id')->nullable()->references('id')->on('product_colors')->onDelete('cascade')->onUpdate('cascade');
            $table->integer("quantity")->unsigned();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('inventory');
    }
};
