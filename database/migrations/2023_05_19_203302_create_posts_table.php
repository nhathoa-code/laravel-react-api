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
        Schema::create('posts', function (Blueprint $table) {
            $table->id();
            $table->string("title");
            $table->string("slug");
            $table->string("description");
            $table->longText('content');
            $table->unsignedBigInteger('author_id');
            $table->foreign("author_id")->references("id")->on("admins")->onDelete('cascade')->onUpdate('cascade');
            $table->unsignedBigInteger('post_category_id');
            $table->foreign("post_category_id")->references("id")->on("post_categories")->onDelete('cascade')->onUpdate('cascade');
            $table->unsignedBigInteger('product_id');
            $table->foreign("product_id")->nullable()->references("id")->on("products")->onDelete('cascade')->onUpdate('cascade');
            $table->timestamps();
            $table->string("post_thumbnail");
            $table->json("images");
            $table->integer("view")->unsigned()->default(0);
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('posts');
    }
};
