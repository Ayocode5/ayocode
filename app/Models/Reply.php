<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class Reply extends Model
{
    use HasFactory, SoftDeletes;

    protected $fillable = [
        'comment_section_id',
        'comment',
        'reply_to'
    ];

    protected $hidden = [
        'guest_id',
        'deleted_at',
        'updated_at'
    ];

    public function guest() {
        return $this->belongsTo(Guest::class, 'guest_id', 'id');
    }
    
}
