<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\CategoryAttributeController;
use App\Http\Controllers\CategoryAttributeValueController;
use App\Http\Controllers\CategoryController;
use App\Http\Controllers\BrandController;
use App\Http\Controllers\ProductController;
use App\Http\Controllers\ProductsGroupController;
use App\Http\Controllers\AuthController;
use App\Http\Controllers\ShoppingCartController;
use App\Http\Controllers\OrderController;
use App\Http\Controllers\CustomerController;
use App\Http\Controllers\AddressController;
use App\Http\Controllers\NotificationController;
use App\Http\Controllers\OnlinePayment;
use App\Http\Controllers\CommentController;
use App\Http\Controllers\CommentToReplyController;
use App\Http\Controllers\ReviewController;
use App\Http\Controllers\ReviewToProveController;
use App\Http\Controllers\GoogleAuthController;
use App\Http\Controllers\ProfileController;
use App\Http\Controllers\BannerController;
use App\Http\Controllers\RoleController;
use App\Http\Controllers\AdminController;
use App\Http\Controllers\PostCategoryController;
use App\Http\Controllers\PostController;
use App\Http\Controllers\CouponController;
use App\Http\Controllers\FlashSaleController;
use App\Http\Controllers\StatisticsController;
/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider and all of them will
| be assigned to the "api" middleware group. Make something great!
|
*/

Route::get('statistics/by_time',[StatisticsController::class,'statisticsByTime']);
Route::get('statistics/access_times',[StatisticsController::class,'increaseAccessTime']);
Route::get('statistics',[StatisticsController::class,'index']);

Route::get('user',[AuthController::class,'show'])->middleware('auth:sanctum');

Route::get('admin',[AdminController::class,'show']);
Route::post("admin/login", [AdminController::class, 'login']);
Route::post("admin/logout", [AdminController::class, 'logout']);

Route::get("category_products/{cat_id}",[CategoryController::class, 'categoryProducts']);
Route::get("all_categories", [CategoryController::class, 'allCategories']);
Route::get("categories/children/{parent_id}", [CategoryController::class, 'children']);
Route::get("category/attributes/{category_id}/{slug?}", [CategoryController::class, 'categoryAttributes']);
Route::get("category/brands",[CategoryController::class, 'categoryBrands']);
Route::resource('categories', CategoryController::class);

Route::resource('brands', BrandController::class);

Route::get("category_attributes/{category_id}", [CategoryAttributeController::class, 'index']);
Route::resource('category_attributes', CategoryAttributeController::class);

Route::get("category_attribute_values/{category_attribute_id}", [CategoryAttributeValueController::class, 'index']);
Route::resource('category_attribute_values', CategoryAttributeValueController::class);

Route::post("upload", [ProductController::class, 'upload']);

Route::get("orders/count",[OrderController::class,"countOrders"]);
Route::get("new_orders",[OrderController::class,"newOrders"]);
Route::resource('orders', OrderController::class);

Route::get("customers",[CustomerController::class,"index"]);
Route::get("customers/{customer}",[CustomerController::class,"customer"]);

Route::post("register", [AuthController::class, 'register']);
Route::post("login", [AuthController::class, 'login']);
Route::post("logout", [AuthController::class, 'logout'])->middleware("auth:sanctum");

Route::post("products/increment_view/{product}",[ProductController::class,'incrementView']);
Route::post("products/increment_search_click/{product}",[ProductController::class,'incrementSearchClick']);
Route::post("products/filter",[ProductController::class,'filter']);
Route::get("products/slug/{product:slug}",[ProductController::class,'slug']);
Route::get("products/filter/categories",[ProductController::class,'filterByCategories']);
Route::get("products/filter/name",[ProductController::class,'filterByName']);
Route::get("products/find/suggestion_products",[ProductController::class,'findSuggestionProducts']);
Route::get("products/search_flash_saled_products",[ProductController::class,'searchFlashSaledProducts']);
Route::get("products/search_trend",[ProductController::class,'searchTrend']);
Route::get("products/most_view",[ProductController::class,'mostView']);
Route::get("products/search_keyword",[ProductController::class,'searchKeyWord']);
Route::resource('products', ProductController::class);

Route::get('products_groups/group',[ProductsGroupController::class,'group']);
Route::resource('products_groups', ProductsGroupController::class);

Route::post('shopping_cart/delete_items',[ShoppingCartController::class,'deleteItems']);
Route::resource('shopping_cart',ShoppingCartController::class);

Route::resource('address',AddressController::class);

Route::get("check_vnpay",[OnlinePayment::class,'vnpay']);

Route::resource('notifications',NotificationController::class);

Route::resource('coupons',CouponController::class);

Route::resource('flash_sales',FlashSaleController::class);

Route::resource('reviews',ReviewController::class);

Route::get('reviews_to_prove/product',[ReviewToProveController::class,'productReviews']);
Route::post('reviews_to_prove/prove/{review_to_prove}',[ReviewToProveController::class,'reviewProve']);
Route::resource('reviews_to_prove',ReviewToProveController::class);

Route::resource('comments',CommentController::class);

Route::get('comments_to_reply/product',[CommentToReplyController::class,'productComments']);
Route::resource('comments_to_reply',CommentToReplyController::class);

Route::resource('banners',BannerController::class);

Route::resource('roles',RoleController::class);

Route::resource('admins',AdminController::class);

Route::resource('post/categories',PostCategoryController::class);

Route::post('post/images',[PostController::class,'upload']);

Route::get('posts/latest/{post_category_id?}',[PostController::class,'latest']);
Route::get('posts/most_viewed/{post_category_id?}',[PostController::class,'most_viewed']);
Route::post('posts/increment_view/{post}',[PostController::class,'incrementView']);
Route::get('posts/product',[PostController::class,'product']);
Route::get('posts/post_category/{category_id}',[PostController::class,'posts_category']);
Route::resource('posts',PostController::class);

Route::get('/auth/redirect', [GoogleAuthController::class,'authRedirect']);
Route::get('/auth/callback', [GoogleAuthController::class,'authCallback']);

Route::post('/user/profile/update',[ProfileController::class,'update']);
Route::get('/user/profile',[ProfileController::class,'index']);

