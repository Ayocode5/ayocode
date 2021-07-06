<?php

namespace App\Http\Controllers;

use Canvas\Models\Topic;
use Illuminate\Http\{Request, JsonResponse};

class PostTopicController extends Controller
{
    /**
     * @param Request $request
     * @return string
     */
    public function topics(Request $request): string
    {
        return Topic::all()->toJson();
    }

    /**
     * @param Request $request
     * @param $slug
     * @return JsonResponse
     */
    public function showTopic(Request $request, $slug): JsonResponse
    {
        $topic = Topic::firstWhere('slug', $slug);

        return $topic ? response()->json($topic, 200) : response()->json(null, 404);
    }

    /**
     * @param Request $request
     * @param $slug
     * @return JsonResponse
     */
    public function postsForTopic(Request $request, $slug): JsonResponse
    {
        $topic = Topic::firstWhere('slug', $slug);

        return $topic ? response()->json($topic->posts()->with('topic', 'user')->paginate(), 200) : response()->json(null, 200);
    }
}
