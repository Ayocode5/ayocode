<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class Portfolio extends Model
{
    use HasFactory, SoftDeletes;

    protected $guarded = ['id'];

    public function images() {
        return $this->hasMany(PortfolioImage::class, 'portfolio_id', 'id');
    }
}
