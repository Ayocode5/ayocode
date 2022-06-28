<?php

namespace App\Http\Controllers;

use App\Models\Post;
use Illuminate\Http\{Request, JsonResponse};

class PostPopularController extends Controller
{
    // Mengambil Post populer dalam rentang bulan saat ini
    public function __invoke(Request $request): JsonResponse
    {
        $limit = $request->input('limit') ?: 5;

        $posts = Post::query()
            ->select(['id', 'slug', 'title'])
            ->with('topic', function($q) {
                $q->select(['name','slug']);
            })
            ->limit($limit)
            ->popular()
            ->published()->get();

        return response()->json($posts, 200);
    }
}
