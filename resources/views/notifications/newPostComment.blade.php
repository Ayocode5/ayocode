<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    {{-- <title>Hello pler</title> --}}
    {{-- <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous"> --}}
    

    <style>
      .comment {
        background: rgb(230, 229, 229);
        border-radius: 2px;
      }

      a:hover {
        text-decoration: none
      }

    </style>
</head>

<body>
    <div class="container">
        <div class="card mt-4">
            <div class="card-body">
                <h5 class="card-title"><strong>{{ $comment->guest->name }}</strong> wrote a comment:</h5>
                <p class="card-text">

                    <div class="mb-2" style="font-style: italic">
                      {!! $comment->comment !!}
                    </div>

                    <a href="{{  request()->url() }}/../blog/posts/{{ $comment->post_id }}" class="card">
                      <div class="card-body">
                        <h4>{{ $comment->post->title }}</h4>
                        {{-- <div class="card-text">
                          {{ $comment->post->summary }}
                        </div> --}}
                      </div>
                    </a>

                </p>

            </div>
        </div>
    </div>

    {{-- <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script> --}}
</body>

</html>
