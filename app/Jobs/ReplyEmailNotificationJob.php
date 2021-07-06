<?php

namespace App\Jobs;

use App\Mail\NewPostReplyNotification;

use Illuminate\Bus\Queueable;
use Illuminate\Support\Facades\Mail;
use Illuminate\Contracts\Queue\ShouldBeUnique;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Foundation\Bus\Dispatchable;
use Illuminate\Queue\InteractsWithQueue;
use Illuminate\Queue\SerializesModels;
use Illuminate\Support\Facades\Log;

class ReplyEmailNotificationJob implements ShouldQueue
{
    use Dispatchable, InteractsWithQueue, Queueable, SerializesModels;

    public $reply;
    
    /**
     * Create a new job instance.
     *
     * @return void
     */
    public function __construct($reply)
    {
        $this->reply = $reply;
    }

    /**
     * Execute the job.
     *
     * @return void
     */
    public function handle()
    {
        
        $this->reply->reply_target = json_parse($this->reply->reply_target);

        // Log::debug(gettype($this->reply->reply_target));
        // Log::debug($this->reply->reply_target->{'email'});

        Mail::to($this->reply->reply_target->{'email'})
                ->send(new NewPostReplyNotification($this->reply));
    }
}
