<!DOCTYPE html>
<html lang="{{ str_replace('_', '-', app()->getLocale()) }}">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
    <meta name="csrf-token" content="{{ csrf_token() }}">

    <title>{{ config('app.name') }} | Studio</title>

    <link rel="stylesheet" type="text/css" href="{{ mix('css/app.css', 'vendor/canvas') }}">
    <link rel="dns-prefetch" href="//fonts.gstatic.com">
    <link rel="stylesheet"
        href="//fonts.googleapis.com/css2?family=Karla&family=Merriweather:wght@400;700&display=swap">

    @if(\Canvas\Canvas::enabledDarkMode($jsVars['user']['dark_mode']))
        <link rel="stylesheet" href="//cdn.jsdelivr.net/gh/highlightjs/cdn-release@10.5.0/build/styles/github.min.css">
    @else
        <link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/highlight.js/10.7.2/styles/dracula.min.css">
    @endif

    <script src="//cdnjs.cloudflare.com/ajax/libs/highlight.js/10.7.2/highlight.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/highlight.js/10.7.2/languages/go.min.js"></script>
</head>

<body class="mb-5" @if(\Canvas\Canvas::enabledDarkMode($jsVars['user']['dark_mode'])) data-theme="dark" @endif
    @if(\Canvas\Canvas::usingRightToLeftLanguage($jsVars['user']['locale'])) data-lang="rtl" @endif>

    @if(!\Canvas\Canvas::assetsUpToDate())
    <div class="alert alert-danger border-0 text-center rounded-0 mb-0">
        {{ trans('canvas::app.assets_are_not_up_to_date') }}
        {{ trans('canvas::app.to_update_run') }}<br /><code>php artisan canvas:publish</code>
    </div>
    @endif

    <div id="canvas">
        <router-view></router-view>
    </div>

    <script>
        window.Canvas = @json($jsVars);
    </script>

    <script type="text/javascript" src="{{ mix('js/app.js', 'vendor/canvas') }}"></script>
</body>

</html>
