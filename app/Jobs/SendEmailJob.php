<?php

namespace App\Jobs;

use App\Mail\NewPostCommentNotification;
use Illuminate\Bus\Queueable;
use Illuminate\Contracts\Queue\ShouldBeUnique;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Foundation\Bus\Dispatchable;
use Illuminate\Queue\InteractsWithQueue;
use Illuminate\Queue\SerializesModels;
use App\Mail\NewPostReplyNotification;
use Illuminate\Support\Facades\Log;
use Illuminate\Support\Facades\Mail;

class SendEmailJob implements ShouldQueue
{
    use Dispatchable, InteractsWithQueue, Queueable, SerializesModels;

    public $newDiscussion;

    /**
     * Create a new job instance.
     *
     * @return void
     */
    public function __construct($newDiscussion)
    {
        $this->newDiscussion = $newDiscussion;
    }

    /**
     * Execute the job.
     *
     * @return void
     */
    public function handle()
    {
        $reply_target = $this->newDiscussion->reply_to ?? null;

        if($reply_target) {
            $this->newDiscussion->reply_to = (object) json_decode($this->newDiscussion->reply_to, true);

            Mail::to($this->newDiscussion->reply_to->email)->send(new NewPostReplyNotification($this->newDiscussion));
        } else {
            Mail::to('ayocode.id@gmail.com')->send(new NewPostCommentNotification($this->newDiscussion));
        }
    }
}
