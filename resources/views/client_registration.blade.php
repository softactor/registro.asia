<!--Extends parent app template-->
@extends('layout.app')
<!--Content insert section-->
@section('content')
<nav class="navbar navbar-default">
  <div class="container-fluid">
    <div class="navbar-header">
      <a class="navbar-brand" href="{{ url('/') }}">Registro.asia</a>
    </div>
    <ul class="nav navbar-nav">
      <li><a href="{{ url('/') }}">Home</a></li>
      <li class="active"><a href="{{ url('/ongoing_events') }}">Ongoing Evens</a></li>
      <li><a href="#">Upcoming events</a></li>
      <li><a href="#">Gallery</a></li>
      <li><a href="#">Contact us</a></li>
      <li><a target="_blank" href="{{ url('/su/dashboard') }}">SA</a></li>
    </ul>
  </div>
</nav>
<section class="container">
    <?php
        $data   =   [
            'page_details'  =>  $page_details,
            'events'        =>  $events,
            'event_forms'   =>  $event_forms,
            'step_form_selector'    =>  'profileSectionArea',
        ];
    ?>
    @include('partial.registration_container', $data)
</section>
@section('footer_js_scrip_area')
@parent
<script type="text/javascript" src="{{ asset('js/registration_process.js')}}"></script>
@endsection
@endsection