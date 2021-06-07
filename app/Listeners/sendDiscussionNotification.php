<?php

namespace App\Listeners;

use App\Events\NewDiscussion;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Queue\InteractsWithQueue;
use Illuminate\Support\Facades\Log;
use Illuminate\Support\Facades\Mail;
use App\Mail\DiscussionNotification;

class sendDiscussionNotification
{
    /**
     * Create the event listener.
     *
     * @return void
     */
    public function __construct()
    {
        //
    }

    /**
     * Handle the event.
     *
     * @param  NewDiscussion  $event
     * @return void
     */
    public function handle(NewDiscussion $event)
    {

        $reply_target = $event->discussion['reply_to'] ?? null;

        if($reply_target) {

            $reply_target = json_decode($reply_target, true);
            Mail::to($reply_target['email'])->send(new DiscussionNotification((object) $event->discussion));
        }

    }
}
