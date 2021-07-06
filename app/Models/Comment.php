<?php

namespace App\Models;

use Canvas\Models\Post;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class Comment extends Model
{
    use HasFactory, SoftDeletes;

    protected $fillable = [
        'post_id',
        'comment',
        'parent_id',
        'reply_target'
    ];

    protected $hidden = ['deleted_at', 'user_id', 'updated_at'];

    public function guest() {
        return $this->belongsTo(Guest::class, 'guest_id', 'id');
    }

    public function replies() {
        return $this->hasMany(Comment::class, 'parent_id');
    }

    public function post() {
        return $this->belongsTo(Post::class, 'post_id', 'id');
    }

    public function ScopeTypeComments($query) {
        return $query->where('parent_id', NULL);
    }

    public function ScopeTypeReplies($query) {
        return $query->where('parent_id', !NULL);
    }

}
