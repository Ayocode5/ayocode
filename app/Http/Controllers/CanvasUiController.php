<?php

namespace App\Http\Controllers;

use App\Http\Controllers\Controller;
use Canvas\Models\User;
use Canvas\Events\PostViewed;
use Canvas\Models\Post;
use Canvas\Models\Tag;
use Canvas\Models\Topic;
use Illuminate\Database\Eloquent\Collection;
use Illuminate\Http\JsonResponse;
use Illuminate\Http\Request;
use Illuminate\Pagination\LengthAwarePaginator;
use Illuminate\Pagination\Paginator;

class CanvasUiController extends Controller
{
    /**
     * @param Request $request
     * @return \Illuminate\Contracts\Foundation\Application|\Illuminate\Contracts\View\Factory|\Illuminate\View\View
     */
    public function index(Request $request)
    {
        return view('canvas-ui')->with([
            'config' => [
                'canvasPath' => config('canvas.path'),
                'user' => $request->user('canvas'),
                'timezone' => config('app.timezone'),
            ],
        ]);
    }

    /**
     * @param Request $request
     * @return LengthAwarePaginator
     */
    public function getPosts(Request $request)
    {

        $keyword = $request->input('search');
        $page = $request->input('page', 1);
        
        if($keyword) {
            $posts = Post::whereRaw("MATCH (title,summary) AGAINST ('$keyword' IN NATURAL LANGUAGE MODE)")->published()->with('user', 'topic')->get();
            // return $posts;
            $page = $page ?: (Paginator::resolveCurrentPage() ?: 1);
            $perPage = 3;
            $posts = $posts instanceof Collection ? $posts : Collection::make($posts);

            if($posts->count() > 0) {
                return new LengthAwarePaginator($posts->forPage($page, $perPage), $posts->count(), $perPage, $page, ['path' => 'http://127.0.0.1:8000/blog/api/posts?search='.$keyword]);
            } return response()->json(["message" => "Keyword do not match for any data", "status_code" => 404], 404);

        } else {
            return Post::latest()->published()->with('user', 'topic')->paginate(3);
        }
    }

    /**
     * Get id and slug for sitemap
     *
     * @return JsonResponse
     */
    public function getSlug(Request $request): JsonResponse
    {
        $summary = Post::query()->select('id', 'slug')->latest()->get();

        return response()->json($summary);
    }

    /**
     * @param Request $request
     * @param $slug
     * @return JsonResponse
     */
    public function showPost(Request $request, $slug): JsonResponse
    {
        $post = Post::with('user', 'tags', 'topic')->firstWhere('slug', $slug);

        if ($post) {
            event(new PostViewed($post));

            return response()->json($post, 200);
        } else {
            return response()->json(null, 404);
        }
    }

    /**
     * @param Request $request
     * @return string
     */
    public function getTags(Request $request): string
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
    public function getPostsForTag(Request $request, $slug): JsonResponse
    {
        $tag = Tag::firstWhere('slug', $slug);

        return $tag ? response()->json($tag->posts()->with('topic', 'user')->paginate(), 200) : response()->json(null, 200);
    }

    /**
     * @param Request $request
     * @return string
     */
    public function getTopics(Request $request): string
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
    public function getPostsForTopic(Request $request, $slug): JsonResponse
    {
        $topic = Topic::firstWhere('slug', $slug);

        return $topic ? response()->json($topic->posts()->with('topic', 'user')->paginate(), 200) : response()->json(null, 200);
    }

    /**
     * @param Request $request
     * @param $id
     * @return JsonResponse
     */
    public function showUser(Request $request, $id): JsonResponse
    {
        $user = User::with('posts')->find($id);

        return $user ? response()->json($user, 200) : response()->json(null, 404);
    }

    /**
     * @param Request $request
     * @param $id
     * @return JsonResponse
     */
    public function getPostsForUser(Request $request, $id): JsonResponse
    {
        $user = User::find($id);

        return $user ? response()->json($user->posts()->published()->with('topic')->paginate(), 200) : response()->json(null, 200);
    }
}
