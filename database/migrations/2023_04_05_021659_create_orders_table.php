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
        Schema::create('orders', function (Blueprint $table) {
            $table->id();
            $table->timestamps();
            $table->unsignedBigInteger('user_id');
            $table->foreign("user_id")->references("id")->on("users")->onDelete('cascade')->onUpdate('cascade');
            $table->json('buyer_info');
            $table->text('note')->nullable();
            $table->string('pttt',100);
            $table->tinyInteger('status');
            $table->string('paid_status',100);
            $table->bigInteger("shipping_fee")->unsigned();
            $table->json("coupons")->nullable();
            $table->bigInteger("subtotal")->unsigned();
            $table->bigInteger("amount_pay")->unsigned();
            $table->text("repay_link")->nullable();
            $table->enum('canceled_by', [0, 1])->nullable();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('orders');
    }
};
