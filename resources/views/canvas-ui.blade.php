<!DOCTYPE html>
<html lang="{{ str_replace('_', '-', app()->getLocale()) }}">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
    <meta name="csrf-token" content="{{ csrf_token() }}">

    <title>ayocode</title>

    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css"
        integrity="sha512-iBBXm8fW90+nuLcSKlbmrPcLa0OT92xO1BIsZ+ywDWZCvqsWgccV3gFoRBv0z+8dLJgyAHIhR35VZc2oM/gI1w=="
        crossorigin="anonymous" />
    <link rel="stylesheet" type="text/css" href="{{ mix('css/canvas-ui.css') }}">
    <link rel="dns-prefetch" href="//fonts.gstatic.com">

    {{-- <link rel="stylesheet" href="//fonts.googleapis.com/css2?family=Karla&family=Merriweather:wght@400;700&display=swap"> --}}

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
        /* @import url('https://fonts.googleapis.com/css2?family=Balsamiq+Sans&display=swap'); */
        @import url('https://fonts.googleapis.com/css2?family=Roboto:wght@300&display=swap');

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
            font-family: 'Roboto', sans-serif;
        }

    </style>

    <script>
        window.CanvasUI = @json($config);

    </script>

    <script type="text/javascript" src="{{ mix('js/canvas-ui.js') }}"></script>
    {{-- <script
  src="https://code.jquery.com/jquery-3.6.0.js"
  integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk="
  crossorigin="anonymous"></script> --}}

</body>

</html>
