<!--Extends parent app template-->
@extends('layout.app')
<!--Content insert section-->
@section('content')
<style>
    .draggable_container{
        border: 1px solid black;
        width: 450px;
        height: 250px;
    }
  #draggable {
      width: 150px;
      height: 150px;
      padding: 0.5em;
      border: 1px solid black;
      cursor: move;
  }
  </style>
<section class="container">
    <div class="container-page">
        <div class="row">
            <div class="col-sm-1"><!--left col-->
                @include('layout.superadmin_dashboard_menu')
            </div><!--/col-3-->
            <div class="col-sm-11">
                <?php
                $firstMonth =   'January '.date('Y');
                $lastMonth  =   'December '.date('Y');
                $fts = strtotime($firstMonth);
                $lts = strtotime($lastMonth);
                ?>
                <h2>
                    {{ $page_details['page_title'] }}
                </h2>
                <div class="draggable_container">
                    <div id="draggable" class="ui-widget-content">
                        <p>Drag me around</p>
                    </div>
                </div>
            </div><!--/tab-content-->

        </div><!--/col-9-->        
    </div>
</section>
@section('footer_js_scrip_area')
@parent
<script>
  $( function() {
    $( "#draggable" ).draggable();
  } );
  </script>
@endsection
@endsection