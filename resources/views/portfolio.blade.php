@extends('layout.base')

@section('main-section')
<h1>Portfolio</h1>

<div>
    <ul>
        @foreach ($portfolios as $portfolio)
            <li>{{ $portfolio->title }}</li>    
            @foreach ($portfolio->images as $image)
                {{ $image->image_url }}
            @endforeach
        @endforeach
    </ul>
</div>
@endsection
