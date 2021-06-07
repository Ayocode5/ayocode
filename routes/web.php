<?php

use App\Events\NewDiscussion;
use App\Http\Controllers\SitemapController;
use App\Http\Controllers\CanvasUiController;
use App\Mail\DiscussionNotification;
use Illuminate\Support\Facades\Mail;
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
    return view('welcome');
});

Route::get('/hello', function () {
    // return event(new NewDiscussion('Hellooooo'));
    // Mail::to('akiyan2002@gmail.com')->send(new DiscussionNotification());
});

Route::get('/sitemap.xml', SitemapController::class);

Route::prefix('blog')->group(function () {
    Route::prefix('api')->group(function () {
        Route::get('posts', [CanvasUiController::class, 'getPosts']);
        Route::get('posts/popular', [CanvasUiController::class, 'getPopularPosts']);
        Route::get('posts/related', [CanvasUiController::class, 'getRelatedPosts']);
        Route::get('posts/discussion', [CanvasUiController::class, 'getCommentsReplies']);
        Route::get('posts/{slug}', [CanvasUiController::class, 'showPost'])
             ->middleware('Canvas\Http\Middleware\Session');
        Route::post('posts/comment',  [CanvasUiController::class, 'storePostComment']);
        Route::post('posts/reply', [CanvasUiController::class, 'storeReplyComment']);
        
        Route::get('tags', [CanvasUiController::class, 'getTags']);
        Route::get('tags/{slug}', [CanvasUiController::class, 'showTag']);
        Route::get('tags/{slug}/posts', [CanvasUiController::class, 'getPostsForTag']);

        Route::get('topics', [CanvasUiController::class, 'getTopics']);
        Route::get('topics/{slug}', [CanvasUiController::class, 'showTopic']);
        Route::get('topics/{slug}/posts', [CanvasUiController::class, 'getPostsForTopic']);

        Route::get('users/{id}', [CanvasUiController::class, 'showUser']);
        Route::get('users/{id}/posts', [CanvasUiController::class, 'getPostsForUser']);
    });

    Route::get('/{view?}', [CanvasUiController::class, 'index'])
         ->where('view', '(.*)')
         ->name('blog');
});


// Route::group(['domain' => 'blog.localhost'], function () {
//     Route::get('/', function () {
//         return "This will respond to requests for 'admin.localhost/'";
//     });
// });