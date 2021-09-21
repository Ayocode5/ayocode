<!DOCTYPE html>
<html lang="{{ str_replace('_', '-', app()->getLocale()) }}">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
    <meta name="csrf-token" content="{{ csrf_token() }}">

    <title>ayocode</title>

    {{-- Font Awesome --}}
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css"
        integrity="sha512-iBBXm8fW90+nuLcSKlbmrPcLa0OT92xO1BIsZ+ywDWZCvqsWgccV3gFoRBv0z+8dLJgyAHIhR35VZc2oM/gI1w=="
        crossorigin="anonymous" />

    {{-- Canvas CSS --}}
    <link rel="stylesheet" type="text/css" href="{{ mix('css/canvas-ui.css') }}">

    {{-- Google Fonts --}}
    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Kirang+Haerang:wght@400;700&display=swap" rel="stylesheet">

    {{-- Sintax Highlighting --}}
    <link rel="stylesheet"
        href="//cdnjs.cloudflare.com/ajax/libs/highlight.js/10.7.2/styles/atelier-cave-light.min.css">
    <script src="//cdnjs.cloudflare.com/ajax/libs/highlight.js/10.7.2/highlight.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/highlight.js/10.7.2/languages/go.min.js"></script>
</head>

<body>

    <div id="ui">
        <router-view></router-view>
    </div>

    <style>
        @import url('https://fonts.googleapis.com/css2?family=Work+Sans:wght@300&display=swap');

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

        body {
            font-family: 'Work Sans', sans-serif;
        }

        body p {
            margin-bottom: 0;
        }

    </style>

    <script>
        window.CanvasUI = @json($config);

    </script>

    <script type="text/javascript" src="{{ mix('js/canvas-ui.js') }}"></script>

</body>

</html>
