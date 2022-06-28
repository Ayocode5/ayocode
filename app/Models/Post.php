<?php

namespace App\Models;

use Canvas\Models\Post as ModelsPost;

class Post extends ModelsPost
{
    public function scopePopular(Builder $query): Builder
    {
        return $query->withCount([
            // 'views as views_count' => function ($q) {
            //     $q
            //     // ->select('id')
            //     ->whereBetween('created_at', [
            //         today()->startOfMonth()->startOfDay()->toDateTimeString(),
            //         today()->endOfMonth()->endOfDay()->toDateTimeString()
            //     ]);
            // },
            'visits as visits_count' => function ($q) {
                $q
                // ->select('id')
                ->whereBetween('created_at', [
                    today()->startOfMonth()->startOfDay()->toDateTimeString(),
                    today()->endOfMonth()->endOfDay()->toDateTimeString()
                ]);
            }
        ])->orderBy('visits_count', 'desc');
    }
}
