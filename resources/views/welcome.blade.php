<!--Extends parent app template-->
@extends('layout.app')
<!--Content insert section-->
@section('content')
<div class="row">
    <div class="col-md-12" col-sm-2>
        <div class="page_default">
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
                        <a href="{{ url('/client_registration') }}">Registration</a>
                        <a href="{{ url('/ongoing_events') }}">Ongoing Evens</a>
                        <a href="#">Upcoming events</a>
                        <a href="{{ url('/su/dashboard') }}">SA</a>
                        <a href="#">Gallery</a>
                        <a href="#">Contact us</a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
@endsection
