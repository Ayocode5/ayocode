<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class Comment extends Model
{
    use HasFactory, SoftDeletes;

    protected $fillable = [
        'post_id',
        'comment'
    ];

    protected $hidden = ['deleted_at', 'guest_id', 'updated_at'];

    public function guest() {
        return $this->belongsTo(Guest::class, 'guest_id', 'id');
    }

    public function replies() {
        return $this->hasMany(Reply::class, 'comment_section_id');
    }
}
