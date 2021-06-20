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
        <h3>{{ $comment->guest->name }} says:</h3>
        <div class="bg-primary rounded">
           {!! $comment->comment !!} 
        </div>
        <a href="http://ayocode.my.id/blog/posts/{{ $comment->post_id }}">open post</a>
    </div>
</body>
</html>