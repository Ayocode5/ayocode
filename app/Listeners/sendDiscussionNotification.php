<?php

namespace App\Listeners;

use App\Events\NewDiscussion;
use App\Models\CommentUser;
use App\Notifications\NewPostDiscussionNotification;
use Illuminate\Bus\Queueable;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Queue\InteractsWithQueue;
use Illuminate\Support\Facades\Notification;

class sendDiscussionNotification implements ShouldQueue
{
    use Queueable;
 
    public function handle(NewDiscussion $event): void
    {

        $reply_target = $event->discussion->reply_target ?? null;

        //USING LARAVEL JOB
        // $reply_target 
        // ? dispatch(new \App\Jobs\ReplyEmailNotificationJob($event->discussion))
        // : dispatch(new \App\Jobs\CommentEmailNotificationJob($event->discussion));

        // USING LARAVEL NOTIFICATION
        if($reply_target) {

            $recipent = CommentUser::where('email', json_parse($reply_target)->email)->get()[0];
            $recipent->notify(new NewPostDiscussionNotification($event->discussion));

        } else {
            
            Notification::route('mail', 'ayocode.id@gmail.com')
            ->notify((new NewPostDiscussionNotification($event->discussion)));
        }           
    }
}
