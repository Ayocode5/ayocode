<?php

namespace App\Http\Controllers;

use Illuminate\Support\Facades\DB;
use Watson\Sitemap\Facades\Sitemap;

class SitemapController extends Controller
{
    public function __invoke()
    {

        $posts = DB::table('canvas_posts')
        ->select('slug','updated_at')
        ->where('deleted_at', null)
        ->where('published_at', '<=', now()->toDateTimeString())
        ->get();

        // dd($posts);
        Sitemap::addTag(url('/'));
        Sitemap::addTag(url('/blog'));
        Sitemap::addTag(url('/blog/tags'));
        Sitemap::addTag(url('/blog/topics'));

        $posts->each(function ($post) {
            Sitemap::addTag(url("/blog/posts/".$post->slug), $post->updated_at, 'daily', '0.8');
        });

        return Sitemap::render();
    }
}
