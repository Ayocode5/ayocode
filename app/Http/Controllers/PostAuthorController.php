<?php

namespace App\Http\Controllers;

use Illuminate\Http\{Request, JsonResponse};
use Canvas\Models\User;

class PostAuthorController extends Controller
{
     /**
     * @param Request $request
     * @param $id
     * @return JsonResponse
     */
    public function show(Request $request, $id): JsonResponse
    {
        $user = User::with('posts')->find($id);

        return $user ? response()->json($user, 200) : response()->json(null, 404);
    }

    /**
     * @param Request $request
     * @param $id
     * @return JsonResponse
     */
    public function getPostsForAuthor(Request $request, $id): JsonResponse
    {
        $user = User::find($id);

        return $user ? response()->json($user->posts()->published()->with('topic')->paginate(), 200) : response()->json(null, 200);
    }
}
