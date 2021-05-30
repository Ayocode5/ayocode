<?php

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
// Route::group(['domain' => 'admin.localhost'], function () {
//     Route::get('/', function () {
//         return "This will respond to requests for 'admin.localhost/'";
//     });
// });

Route::get('/', function () {
    return view('welcome');
});

Route::prefix('blog')->group(function () {
    Route::prefix('api')->group(function () {
        Route::get('posts', [\App\Http\Controllers\CanvasUiController::class, 'getPosts']);
        Route::get('posts/popular', [\App\Http\Controllers\CanvasUiController::class, 'getPopularPosts']);
        Route::get('posts/related', [\App\Http\Controllers\CanvasUiController::class, 'getRelatedPosts']);
        Route::get('posts/discussion', [\App\Http\Controllers\CanvasUiController::class, 'getCommentsReplies']);
        Route::get('posts/{slug}', [\App\Http\Controllers\CanvasUiController::class, 'showPost'])
             ->middleware('Canvas\Http\Middleware\Session');
        Route::post('posts/comment',  [\App\Http\Controllers\CanvasUiController::class, 'storePostComment']);
        Route::post('posts/reply', [\App\Http\Controllers\CanvasUiController::class, 'storeReplyComment']);
        
        Route::get('tags', [\App\Http\Controllers\CanvasUiController::class, 'getTags']);
        Route::get('tags/{slug}', [\App\Http\Controllers\CanvasUiController::class, 'showTag']);
        Route::get('tags/{slug}/posts', [\App\Http\Controllers\CanvasUiController::class, 'getPostsForTag']);

        Route::get('topics', [\App\Http\Controllers\CanvasUiController::class, 'getTopics']);
        Route::get('topics/{slug}', [\App\Http\Controllers\CanvasUiController::class, 'showTopic']);
        Route::get('topics/{slug}/posts', [\App\Http\Controllers\CanvasUiController::class, 'getPostsForTopic']);

        Route::get('users/{id}', [\App\Http\Controllers\CanvasUiController::class, 'showUser']);
        Route::get('users/{id}/posts', [\App\Http\Controllers\CanvasUiController::class, 'getPostsForUser']);
    });

    Route::get('/{view?}', [\App\Http\Controllers\CanvasUiController::class, 'index'])
         ->where('view', '(.*)')
         ->name('blog');
});
