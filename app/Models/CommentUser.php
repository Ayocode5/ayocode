<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;
use Illuminate\Notifications\Notifiable;

class CommentUser extends Model
{
    use HasFactory, SoftDeletes, Notifiable;

    protected $table = "comment_users";

    protected $fillable = [
        'name',
        'email',
        'website'
    ];

    public function comments() {
        return $this->hasMany(Comment::class, 'user_id');
    }

    public function replies() {
        return $this->hasMany(Comment::class, 'user_id');
    }

    // Return email address only...
    public function routeNotificationForMail($notification)
    {
        return $this->email;
    }
}
