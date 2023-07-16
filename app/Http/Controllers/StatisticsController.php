<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Product;
use App\Models\Order;
use App\Models\User;
use App\Models\Category;
use Illuminate\Support\Facades\Storage;
use Illuminate\Support\Facades\DB;

class StatisticsController extends Controller
{
    public function __construct()
    {
        $this->middleware('auth:sanctum');
    }

    public function index()
    {
        $data = array();
        $data['total_users'] = User::count();
        $data['total_bought_users'] = count(Order::where("status","Hoàn thành")->groupBy("user_id")->get()->toArray());
        $data['total_products'] = Product::count();
        $data['total_orders'] = Order::count();
        $data['total_completed_orders'] = Order::where("status","Hoàn thành")->get();
        $data['total_categories'] = Category::count();
        $data['best_sold_products'] = Product::orderBy("sold","desc")->limit(10)->get();
        $data['most_viewed_products'] = Product::orderBy("view","desc")->limit(10)->get();
        $data['data_statistics'] = Storage::json('data_statistics.json');
        return $data;
    }

    public function increaseAccessTime()
    {
        $data = Storage::json('data_statistics.json');
        $data["access_times"] += 1;
        Storage::put('data_statistics.json', json_encode($data));
    }

    public function statisticsByTime(Request $request)
    {
        $type_of_time = $request->type_of_time;
        $data = array();
        if($type_of_time === "week"){
            return Order::select("*",DB::raw("sum(amount_pay) as revenue"),DB::raw("count(*) as orders"),DB::raw("DATE(created_at) as date"))->whereNotIn("status",["Chờ thanh toán","Đã Hủy"])->where('created_at',">=",$request->start_week)->where("created_at","<=",$request->end_week)->groupBy("date")->get();
        }else if($type_of_time === "month"){
            return Order::select("*",DB::raw("sum(amount_pay) as revenue"),DB::raw("count(*) as orders"),DB::raw("DATE(created_at) as date"))->whereNotIn("status",["Chờ thanh toán","Đã Hủy"])->whereMonth('created_at', $request->month)->whereYear("created_at",$request->year)->groupBy("date")->get();
        }else if($type_of_time === "date"){
            return Order::select("*",DB::raw("sum(amount_pay) as revenue"),DB::raw("count(*) as orders"),DB::raw("HOUR(created_at) as hour"))->whereDate('created_at', $request->Date)->whereNotIn("status",["Chờ thanh toán","Đã Hủy"])->groupBy("hour")->get();
        }
       
    }
}
