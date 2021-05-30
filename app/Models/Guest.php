<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class Guest extends Model
{
    use HasFactory, SoftDeletes;

    protected $fillable = [
        'name',
        'email',
        'website'
    ];

    public function comments() {
        return $this->hasMany(Comment::class, 'guest_id');
    }

    public function replies() {
        return $this->hasMany(Reply::class, 'guest_id');
    }
}
