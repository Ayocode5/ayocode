<?php

namespace App\Http\Controllers;

use Canvas\Models\Tag;
use Illuminate\Http\{Request, JsonResponse};

class PostTagController extends Controller
{
       /**
     * @param Request $request
     * @return string
     */
    public function tags(Request $request): string
    {
        return Tag::all()->toJson();
    }

    /**
     * @param Request $request
     * @param $slug
     * @return JsonResponse
     */
    public function showTag(Request $request, $slug): JsonResponse
    {
        $tag = Tag::firstWhere('slug', $slug);

        return $tag ? response()->json($tag, 200) : response()->json(null, 404);
    }

    /**
     * @param Request $request
     * @param $slug
     * @return JsonResponse
     */
    public function postsForTag(Request $request, $slug): JsonResponse
    {
        $tag = Tag::firstWhere('slug', $slug);

        return $tag ? response()->json($tag->posts()->with('topic', 'user')->paginate(), 200) : response()->json(null, 200);
    }
}
