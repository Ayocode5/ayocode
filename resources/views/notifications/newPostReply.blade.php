<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    {{-- <title>Hello pler</title> --}}
</head>
<body>
    <div>
        <h4>
            {{ $reply->guest->name }} in post <a href="https://ayocode.my.id/blog/posts/{{ $reply->post_id }}">{{ $reply->post_id }}</a> reply your comment
        </h4>
        <div>
            {!! $reply->comment !!}
        <div>
    </div>
</body>
</html>