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
        Schema::create('comments_to_reply', function (Blueprint $table) {
            $table->id();
            $table->unsignedBigInteger('product_id');
            $table->foreign("product_id")->references("id")->on("products")->onDelete('cascade')->onUpdate('cascade');
            $table->foreignId("comment_id")->nullable()->references("id")->on("comments")->onDelete('cascade')->onUpdate('cascade');
            $table->json("commenter");
            $table->text("content");
            $table->timestamp('created_at');
            $table->unsignedBigInteger("reply_to")->nullable();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('comments_to_reply');
    }
};
