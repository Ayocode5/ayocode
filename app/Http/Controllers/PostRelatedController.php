<?php

namespace App\Http\Controllers;

use Canvas\Models\Topic;

use Illuminate\Support\Facades\DB;
use Illuminate\Http\{Request, JsonResponse};

class PostRelatedController extends Controller
{
    // Mengambil Post yang tema nya masih berhubungan dengan post yang sedang dibuka
    public function __invoke(Request $request): JsonResponse
    {
        $topic_id = $request->input('topic');
        $current_post_id = $request->input('current_post');

        if ($topic_id && $current_post_id) {

            $related_posts = Topic::select('id')->where('id', $topic_id)->with(['posts' => function ($query) use ($current_post_id) {
                $query->select('id', 'title', 'summary', 'slug', 'featured_image', 'featured_image_caption')
                    ->where('id', '!=', $current_post_id)
                    ->published()
                    ->orderBy(DB::raw('RAND()'));
            }])->get()->pluck('posts')[0];

            return response()->json($related_posts, 200);
        }

        return response()->json(['message' => 'topic_id and post_id required!'], 200);
    }
}
