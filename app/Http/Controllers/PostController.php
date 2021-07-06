<?php

namespace App\Http\Controllers;

use Canvas\Models\Post;
use Canvas\Events\PostViewed;
use Illuminate\Http\{Request, JsonResponse};
use Illuminate\Pagination\{LengthAwarePaginator, Paginator};
use Illuminate\Database\Eloquent\Collection;
use Illuminate\Support\Facades\Log;

class PostController extends Controller
{
    /**
     * @param Request $request
     * @return LengthAwarePaginator
     */
    public function posts(Request $request)
    {

        $keyword = $request->input('search');
        $page = $request->input('page', 1);
        $limit = $request->input('limit', 3);

        //Full Text Search, Will be replaced with elastic search :v
        if ($keyword) {
            $posts = Post::whereRaw("MATCH (title,summary) AGAINST ('$keyword' IN NATURAL LANGUAGE MODE)")->published()->with('user', 'topic')->get();

            $page = $page ?: (Paginator::resolveCurrentPage() ?: 1);
            $perPage = $limit;
            $posts = $posts instanceof Collection ? $posts : Collection::make($posts);

            // dd($posts);

            if ($posts->count() > 0) {

                $posts = new LengthAwarePaginator($posts->forPage($page, $perPage), $posts->count(), $perPage, $page, ['path' => 'http://127.0.0.1:8000/blog/api/posts?search=' . $keyword]);
                $posts = collect($posts);

                //insert 'read_time' attribute
                $posts['data'] = array_map(function ($post) {
                    $post['read_time'] = $this->calculateReadTime($post['body']);
                    return $post;
                }, $posts['data']);

                return $posts;
            }

            return response()->json(["message" => "Keyword do not match for any data", "status_code" => 404], 404);

        } else {

            $posts = Post::latest()->published()->with('user', 'topic')->paginate($limit);
            $posts = collect($posts);

            //insert 'read_time' attribute
            $posts['data'] = array_map(function ($post) {
                $post['read_time'] = self::calculateReadTime($post['body']);
                return $post;
            }, $posts['data']);

            return $posts;
        }
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

            $post->{'read_time'} = self::calculateReadTime($post->body);

            event(new PostViewed($post));

            return response()->json($post, 200);
        } else {
            return response()->json(null, 404);
        }
    }

    private static function calculateReadTime(?string $text): string
    {
        // Only count words in our estimation
        $words = str_word_count(strip_tags($text));

        // Divide by the average number of words per minute
        $minutes = ceil($words / 250);

        // The user is optional since we append this attribute
        // to every model and we may be creating a new one
        return sprintf('%d %s', $minutes, 'minutes');
    }
}
