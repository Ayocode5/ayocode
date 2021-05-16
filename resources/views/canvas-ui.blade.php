<!DOCTYPE html>
<html lang="{{ str_replace('_', '-', app()->getLocale()) }}">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
    <meta name="csrf-token" content="{{ csrf_token() }}">

    <title>ayocode</title>

    <link rel="stylesheet" type="text/css" href="{{ mix('css/canvas-ui.css') }}">
    <link rel="dns-prefetch" href="//fonts.gstatic.com">
    <link rel="stylesheet"
        href="//fonts.googleapis.com/css2?family=Karla&family=Merriweather:wght@400;700&display=swap">

    <link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/highlight.js/10.7.2/styles/dracula.min.css">
    <script src="//cdnjs.cloudflare.com/ajax/libs/highlight.js/10.7.2/highlight.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/highlight.js/10.7.2/languages/go.min.js"></script>
</head>

<body class="mb-5">

    <div id="ui">
        <router-view></router-view>
    </div>

    <script>
        window.CanvasUI = @json($config);

    </script>

    <script type="text/javascript" src="{{ mix('js/canvas-ui.js') }}"></script>

    <style>
        .ql-syntax {
            counter-reset: line;
            padding-left: 0;
        }

        .ql-syntax p:before {
            counter-increment: line;
            content: counter(line);
            display: inline-block;
            border-right: 1px solid #ddd;
            padding: 0 .5em;
            margin-right: .5em;
            color: #888
        }

    </style>
</body>

</html>
