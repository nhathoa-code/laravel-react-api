<?php

namespace App\Listeners;

use App\Events\OrderStatusUpdate;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Queue\InteractsWithQueue;
use App\Models\OrderTracker;

class UpdateOrderTracker
{
    /**
     * Create the event listener.
     */
    public function __construct()
    {
        //
    }

    /**
     * Handle the event.
     */
    public function handle(OrderStatusUpdate $event): void
    {
        $orderTracker = new OrderTracker();
        $orderTracker->order_id = $event->order_id;
        $orderTracker->message = $event->message;    
        $orderTracker->save();
    }
}
