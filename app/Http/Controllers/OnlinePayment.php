<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Order;
use App\Events\OrderStatusUpdate;
class OnlinePayment extends Controller
{
    public function vnpay()
    {
        $vnp_HashSecret = "AJQWNOVGZEXBFIVUMUJUAIFNBJZIHPTL";
        $vnp_SecureHash = $_GET['vnp_SecureHash'];
        $inputData = array();
        foreach ($_GET as $key => $value) {
            if (substr($key, 0, 4) == "vnp_") {
                $inputData[$key] = $value;
            }
        }
        unset($inputData['vnp_SecureHash']);
        ksort($inputData);
        $i = 0;
        $hashData = "";
        foreach ($inputData as $key => $value) {
            if ($i == 1) {
                $hashData = $hashData . '&' . urlencode($key) . "=" . urlencode($value);
            } else {
                $hashData = $hashData . urlencode($key) . "=" . urlencode($value);
                $i = 1;
            }
        }

        $secureHash = hash_hmac('sha512', $hashData, $vnp_HashSecret);

        if ($secureHash == $vnp_SecureHash) {
            if ($_GET['vnp_ResponseCode'] == '00') {
                $order = Order::find($_GET['vnp_TxnRef']);
                $order->status = 2;
                $order->admin_status = 2;
                $order->repay_link = null;
                $order->paid_status = "Đã thanh toán | MGD:" . $_GET['vnp_TransactionNo'];
                $order->save();
                OrderStatusUpdate::dispatch($order->id,"Đơn hàng đã thanh toán");
                OrderStatusUpdate::dispatch($order->id,"Đơn hàng đã được xác nhận");
            }
        } 
        return response()->json(['secureHash'=>$secureHash],200);
    }
}
