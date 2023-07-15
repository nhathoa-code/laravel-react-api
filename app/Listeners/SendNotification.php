<?php

namespace App\Listeners;

use Illuminate\Http\Request;
use App\Models\Notification;
use App\Models\OrderTracker;
use App\Events\OrderPlaced;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Queue\InteractsWithQueue;


class SendNotification
{
    /**
     * Create the event listener.
     */
    public function __construct(public Request $request)
    {
        //
    }

    /**
     * Handle the event.
     */
    public function handle(OrderPlaced $event): void
    {
        $notification = new Notification();
        $notification->user_id = $this->request->user()->id;
        $notification->title = "Đặt hàng thành công";
        $notification->content = "Đơn hàng với mã đơn {{$event->order->id}} đã được đặt thành công.Bạn có thể xem chi tiết đơn hàng.";
        $notification->action_title = "Xem chi tiết";
        $notification->action_link = "/account/order/".$event->order->id;
        $notification->save();
        $orderTracker = new OrderTracker();
        $orderTracker->order_id = $event->order->id;
        $orderTracker->message = "Đơn hàng đã được đặt thành công";
        $orderTracker->save();
    }
}
