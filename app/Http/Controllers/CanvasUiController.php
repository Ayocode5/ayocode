<?php

namespace App\Http\Controllers;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;


class CanvasUiController extends Controller
{
    /**
     * @param Request $request
     * @return \Illuminate\Contracts\Foundation\Application|\Illuminate\Contracts\View\Factory|\Illuminate\View\View
     */
    public function __invoke(Request $request)
    {
        return view('canvas-ui')->with([
            'config' => [
                'canvasPath' => config('canvas.path'),
                'user' => $request->user('canvas'),
                'timezone' => config('app.timezone'),
            ],
        ]);
    }
   
}
