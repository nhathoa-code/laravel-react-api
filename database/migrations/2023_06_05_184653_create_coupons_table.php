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
        Schema::create('coupons', function (Blueprint $table) {
            $table->id();
            $table->string("code",50);
            $table->string("description");
            $table->date("start");
            $table->date("end");
            $table->enum('coupon_type', ['free_ship', 'coupon']);
            $table->enum('type', ['percent', 'fixed','free_ship']);
            $table->integer('maximum_discount')->unsigned()->nullable();
            $table->bigInteger("amount")->unsigned();
            $table->bigInteger("minimum_spend")->unsigned();
            $table->integer('limit_per_coupon')->unsigned();
            $table->integer('used')->unsigned()->default(0);
            $table->integer('limit_per_user')->unsigned();
            $table->jsonb('applied_products')->nullable();
            $table->json('users')->nullable();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('coupons');
    }
};
