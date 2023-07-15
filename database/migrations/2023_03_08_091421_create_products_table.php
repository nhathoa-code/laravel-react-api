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
        Schema::create('products', function (Blueprint $table) {
            $table->id();
            $table->string("name", 255)->unique();
            $table->string("slug")->unique();
            $table->bigInteger("price")->unsigned();
            $table->bigInteger("discounted_price")->unsigned();
            $table->text("image");
            $table->longtext("description")->default("");
            $table->json("description_images")->default("[]");
            $table->longtext("specification")->default("[]");
            $table->string("dir");
            $table->tinyInteger('home_display',1)->unsigned()->default(0);
            $table->integer('sold')->unsigned()->default(0);
            $table->integer('search_click')->unsigned()->default(0);
            $table->integer("view")->unsigned()->default(0);
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('products');
    }
};
