<!--Extends parent app template-->
@extends('layout.app')
<!--Content insert section-->
@section('content')
<style>
    .draggable {
      width: 50px;
      height: 50px;
      padding: 0.5em;
      float: left;
      margin: 0 10px 10px 0;
      cursor:move;      
      margin-bottom:20px;
  }

  #containment-wrapper {
      width: 500px;
      height: 500px;
      border:2px solid #ccc;
      padding: 10px;
  }
  </style>
<section class="container">
    <div class="container-page">
        <div class="row">
            <div class="col-sm-1"><!--left col-->
                @include('layout.superadmin_dashboard_menu')
            </div><!--/col-3-->
            <div class="col-sm-11">
                <h2>
                    {{ $page_details['page_title'] }}
                </h2>
                <div class="row">
                    <div class="col-md-12">
                        <div class="form-group">
                            <?php
                                $get_background_url     =   $page_details['get_background_url'];
                            ?>
                            <select class="form-control" id="event_id" name="event_id" onchange="set_event_namebadge_background(this.value, '{{ url($get_background_url) }}');">
                            <option value="">Events List</option>
                            <?php
                                $events     =   get_table_data_by_table('events'); 
                                foreach($events as $e){
                            ?>
                            <option value="<?php echo $e->id ?>"><?php echo $e->title ?></option>
                            <?php } ?>
                        </select>
                    </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-12">
                        <div class="row">                            
                            <div class="col-md-2">
                                <div class="dropable_object" id="salutation">Salutation</div>
                                <div class="dropable_object" id="first_name">First Name</div>
                                <div class="dropable_object" id="last_name">Last Name</div>
                                <div class="dropable_object" id="company_name">Company Name</div>
                                <div class="dropable_object" id="gender">Gender</div>
                                <div class="dropable_object" id="mobile">Mobile</div>
                                <div class="dropable_object" id="email">Email</div>
                            </div>
                            <div class="col-md-10">
                                <div id="message" style="display:none"><h1>Saved!</h1></div>                
                                <div id="containment-wrapper">
                                    <div id="content_loader">
                                        <img src="{{ asset('images/content_loading.gif') }}" alt="Wait" />
                                    </div>
                                    <div id="1" class="ui-widget-content draggable" data-left="20px" data-top="20px" style="position: absolute; left:20px; top:20px">Table</div>
                                    <div id="2" class="ui-widget-content draggable" data-left="97px" data-top="102px" style="position: absolute; left: 97px;top:102px;">Chair</div>
                                    <div id="3" class="ui-widget-content draggable" data-left="98px" data-top="20px" style="position: absolute; left:98px; top: 20px;">Couch</div>
                                    <div id="4" class="ui-widget-content draggable" data-left="176px" data-top="20px" style="position: absolute; left: 176px; top:20px;">Window</div>                     
                                </div>
                                    <input type="hidden" id="namebadge_bg_image_path" name="namebadge_bg_image_path" value="{{ $page_details['background_image_path'] }}" />
                                <button id="save" onclick="save_position()">Save Position</button>
                            </div>
                        </div>
                    </div><!--/parent column end -->
                </div>
            </div>
        </div><!--/col-9-->        
    </div>
</section>
@section('footer_js_scrip_area')
@parent
<script type="text/javascript" src="{{ asset('js/name_badge_position.js')}}"></script>
@endsection
@endsection