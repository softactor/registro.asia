<!doctype html>
<html lang="{{ app()->getLocale() }}">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">

        <title>Laravel</title>
        <!-- main stylesheet link -->        
        <link rel="stylesheet" type="text/css" href="{{ asset('css/latofonts.css') }}">  
        <link rel="stylesheet" type="text/css" href="{{ asset('css/latostyle.css') }}">  
        <link rel="stylesheet" type="text/css" href="{{ asset('css/style.css') }}">     
    </head>
    <body>
        <div class="flex-center position-ref full-height">
            @if (Route::has('login'))
                <div class="top-right links">
                    @auth
                        <a href="{{ url('/home') }}">Home</a>
                    @else
                        <a href="{{ route('login') }}">Login</a>
                        <a href="{{ route('register') }}">Register</a>
                    @endauth
                </div>
            @endif

            <div class="content">
                <div class="title m-b-md">
                    Registro.asia
                </div>

                <div class="links">
                    <a href="#">Registration</a>
                    <a href="#">Ongoing Evens</a>
                    <a href="#">Upcoming events</a>
                    <a href="#">About us</a>
                    <a href="#">Gallery</a>
                    <a href="#">Contact us</a>
                </div>
            </div>
        </div>
    </body>
</html>
