<?php

namespace App\Http\Controllers;

use App\Events\NewDiscussion;
use App\Http\Controllers\Controller;
use App\Models\Comment;
use App\Models\Guest;
use App\Models\Reply;
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
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Log;

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
        $limit = $request->input('limit', 3);

        //Search mathed posts AKA Full Text Search
        if ($keyword) {
            $posts = Post::whereRaw("MATCH (title,summary) AGAINST ('$keyword' IN NATURAL LANGUAGE MODE)")->published()->with('user', 'topic')->get();

            $page = $page ?: (Paginator::resolveCurrentPage() ?: 1);
            $perPage = $limit;
            $posts = $posts instanceof Collection ? $posts : Collection::make($posts);

            if ($posts->count() > 0) {
                return new LengthAwarePaginator($posts->forPage($page, $perPage), $posts->count(), $perPage, $page, ['path' => 'http://127.0.0.1:8000/blog/api/posts?search=' . $keyword]);
            }
            return response()->json(["message" => "Keyword do not match for any data", "status_code" => 404], 404);
        } else {
            return Post::latest()->published()->with('user', 'topic')->paginate($limit);
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

    // Mengambil Post populer dalam rentang bulan saat ini
    public function getPopularPosts(Request $request): JsonResponse
    {
        $limit = $request->input('limit') ?: 5;

        $posts = Post::query()
            ->select(['id', 'slug', 'title', 'summary', 'featured_image', 'featured_image_caption'])
            ->with('topic')
            ->limit($limit)
            ->withCount([
                'views as views_count' => function ($q) {
                    $q->whereBetween('created_at', [
                        today()->startOfMonth()->startOfDay()->toDateTimeString(),
                        today()->endOfMonth()->endOfDay()->toDateTimeString()
                    ]);
                },
                'visits as visits_count' => function ($q) {
                    $q->whereBetween('created_at', [
                        today()->startOfMonth()->startOfDay()->toDateTimeString(),
                        today()->endOfMonth()->endOfDay()->toDateTimeString()
                    ]);
                }
            ])->orderBy('visits_count', 'desc')->published()->get();

        return response()->json($posts, 200);
    }

    // Mengambil Post yang tema nya masih berhubungan dengan post yang sedang dibuka
    public function getRelatedPosts(Request $request): JsonResponse
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

    //fetch discussion by specific post_id
    public function getPostComments(Request $request): JsonResponse
    {
        $post_id = $request->input('post_id');
        // $page = $request->input('page') ?? 1;

        $comments = DB::table('comments as c')
            ->select('c.id', 'c.post_id', 'g.name', 'g.email', 'c.comment', 'c.created_at')
            ->where('post_id', $post_id)
            ->leftJoin('guests as g', 'g.id', '=', 'c.guest_id')
            ->orderBy('c.created_at', 'desc')
            ->simplePaginate(3);

        $comments = collect($comments);

        array_map(function($comment){
            return $comment->total_replies = DB::table('replies')
            ->select(DB::raw('COUNT(id) AS total_replies'))
            ->where('comment_section_id', $comment->id)
            ->get()[0]->total_replies;
        }, $comments['data']);

        return response()->json($comments, 200);
    }

    public function getPostReply(Request $request) {
        $comment_section_id = $request->input('comment_id');

        $replies = DB::table('replies as r')
                ->select('r.id', 'r.comment_section_id', 'g.name', 'g.email', 'r.comment', 'r.reply_to', 'r.created_at')
                ->where('comment_section_id', $comment_section_id)
                ->leftJoin('guests as g', 'g.id', '=', 'r.guest_id')
                ->get();

        return response()->json($replies, 200);
    }

    //Perform Post Comment
    public function storePostComment(Request $request): JsonResponse
    {
        if ($request->validate([
            'post_id' => 'required',
            'post_slug' => 'required',
            'name' => 'required|max:100',
            'email' => 'required|email|max:100',
            'comment' => 'required|string'
        ])) {
            $guest = Guest::firstOrCreate(['email' => $request->input('email'), 'name' => $request->input('name')]);
            $comment = $guest->comments()->create(['post_id' => $request->input('post_id'), 'comment' => $request->input('comment')]);

            if ($guest) {

                event(new NewDiscussion($comment)); 

                return response()->json($comment, 200);
            }
        }

        return response()->json('Validation failed!', 200);
    }

    //perform Reply Comment
    public function storePostReply(Request $request): JsonResponse
    {
        if ($request->validate([
            'comment_section_id' => 'required',
            'name' => 'required|max:100',
            'email' => 'required|email|max:100',
            'comment' => 'required|string',
            'reply_to' => 'required|string'
        ])) {

            $guest = Guest::firstOrCreate(['email' => $request->input('email'), 'name' => $request->input('name')]);
            $reply = $guest->replies()->create([
                'comment_section_id' => $request->input('comment_section_id'),
                'comment' => $request->input('comment'),
                'reply_to' => $request->input('reply_to'),
            ]);

            if ($guest) {
                event(new NewDiscussion($reply));

                return response()->json($reply, 200);
            }
        }

        return response()->json('Validation failed!', 200);
    }
}
