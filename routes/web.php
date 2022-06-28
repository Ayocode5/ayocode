<?php

use App\Http\Controllers\SitemapController;
use App\Http\Controllers\CanvasUiController;
use App\Http\Controllers\PostAuthorController;
use App\Http\Controllers\PostCommentController;
use App\Http\Controllers\PostController;
use App\Http\Controllers\PostPopularController;
use App\Http\Controllers\PostRelatedController;
use App\Http\Controllers\PostTagController;
use App\Http\Controllers\PostTopicController;
use App\Http\Controllers\PortfolioController;
//use App\Models\{Comment, Guest, Portfolio};

use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

Route::get('/', function () {
    return view('home');
});
Route::get('/react', function () {
    return view('home-react');
});
Route::prefix('/portfolio')->group(function() {
    // return redirect()->route('canvas.login');
    Route::get('/', [PortfolioController::class, 'index']);
});

Route::prefix('blog')->group(function () {
    Route::prefix('api')->group(function () {

        //Handle Post
        Route::get('posts', [PostController::class, 'posts']);

        //Handle Popular Post
        Route::get('posts/popular', PostPopularController::class);

        //Handle Related Post
        Route::get('posts/related', PostRelatedController::class);

        //Handle Comment and Reply for Posts
        Route::get('posts/comment', [PostCommentController::class, 'comments']);
        Route::get('posts/reply', [PostCommentController::class, 'replies']);
        Route::post('posts/comment',  [PostCommentController::class, 'saveComment']);
        Route::post('posts/reply', [PostCommentController::class, 'saveReply']);

        //Handle Specific Post
        Route::get('posts/{slug}', [PostController::class, 'showPost'])
             ->middleware('Canvas\Http\Middleware\Session');

        //Handle Post Tags
        Route::get('tags', [PostTagController::class, 'tags']);
        Route::get('tags/{slug}', [PostTagController::class, 'showTag']);
        Route::get('tags/{slug}/posts', [PostTagController::class, 'postsForTag']);

        //Handle Post Topics
        Route::get('topics', [PostTopicController::class, 'topics']);
        Route::get('topics/{slug}', [PostTopicController::class, 'showTopic']);
        Route::get('topics/{slug}/posts', [PostTopicController::class, 'postsForTopic']);

        //Handle Post User
        Route::get('users/{id}', [PostAuthorController::class, 'show']);
        Route::get('users/{id}/posts', [PostAuthorController::class, 'getPostsForAuthor']);
    });

    Route::get('/{view?}', CanvasUiController::class)
         ->where('view', '(.*)')
         ->name('blog');
});

Route::get('/sitemap.xml', SitemapController::class);


// Route::group(['domain' => 'blog.localhost'], function () {
//     Route::get('/', function () {
//         return "This will respond to requests for 'admin.localhost/'";
//     });
// });
