<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Symfony\Component\HttpFoundation\JsonResponse;
use App\Models\{CommentUser};
use App\Events\NewDiscussion;
use App\Http\Requests\CommentRequest;
use App\Http\Requests\ReplyRequest;
use Canvas\Canvas;
use Illuminate\Support\Facades\Log;

class PostCommentController extends Controller
{
    /**
     * fetch post comments by specific post_id
     */
    public function comments(Request $request): JsonResponse
    {
        $post_slug = $request->input('post_slug');
        $limit = $request->input('limit') ?: 3;

        $comments = DB::table('comments as c')
            ->select('c.id', 'c.post_id', 'user.name', 'user.email', 'user.is_admin', 'user.avatar', 'c.comment', 'c.created_at')
            ->where('post_id', $post_slug)
            ->where('parent_id', NULL)
            ->leftJoin('comment_users as user', 'user.id', '=', 'c.user_id')
            ->orderBy('c.created_at', 'desc')
            ->simplePaginate($limit);

        $comments = collect($comments);

        array_map(function ($comment) {
            return $comment->total_replies = DB::table('comments')
                ->select(DB::raw('COUNT(id) AS total_replies'))
                ->where('parent_id', $comment->id)
                ->get()[0]->total_replies;
        }, $comments['data']);

        return response()->json($comments, 200);
    }

    /**
     * fetch post replies by specific parent_id (comment_id)
     */
    public function replies(Request $request): JsonResponse
    {
        $parent_id = $request->input('parent_id');

        $replies = DB::table('comments as r')
            ->select('r.id', 'r.parent_id', 'user.name', 'user.email', 'user.is_admin', 'user.avatar', 'r.comment', 'r.reply_target', 'r.created_at', 'r.deleted_at')
            ->where('parent_id', $parent_id)
            ->leftJoin('comment_users as user', 'user.id', '=', 'r.user_id')
            ->get();

        return response()->json($replies, 200);
    }

    /**
     * save post comment
     */
    public function saveComment(CommentRequest $request): JsonResponse
    {
        $commentUser = CommentUser::firstOrCreate([
            'email' => $request->input('email'),
            'name' => $request->input('name'),
        ]);

        //Adding Avatar
        $commentUser->avatar ?: $commentUser->avatar = Canvas::gravatar($request->input('email'));
        $commentUser->save();

        //Store Comment Data
        $comment = $commentUser->comments()->create([
            'post_id' => $request->input('post_slug'),
            'comment' => $request->input('comment')
        ]);
        $comment->{'avatar'} = $commentUser->avatar;

        if ($comment) {

            event(new NewDiscussion($comment));

            return response()->json($comment, 200);
        }
    }

    /**
     * save post reply
     */
    public function saveReply(ReplyRequest $request): JsonResponse
    {
        $commentUser = CommentUser::firstOrCreate([
            'email' => $request->input('email'),
            'name' => $request->input('name'),
        ]);

        //Adding Avatar
        $commentUser->avatar ?: $commentUser->avatar = Canvas::gravatar($request->input('email'));
        $commentUser->save();

        //Storing Reply Data
        $reply = $commentUser->replies()->create([
            'post_id' => $request->input('post_slug'),
            'parent_id' => $request->input('parent_id'),
            'comment' => $request->input('comment'),
            'reply_target' => $request->input('reply_target')
        ]);
        $reply->{'avatar'} = $commentUser->avatar;

        if ($reply) {
            event(new NewDiscussion($reply));

            return response()->json($reply, 200);
        }
    }
}
