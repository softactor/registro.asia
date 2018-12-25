<!--Extends parent app template-->
@extends('layout.app')
<!--Content insert section-->
@section('content')
<style>
  #containment-wrapper {
      width: 500px;
      height: 500px;
      border:1px solid #ccc;
  }
  #containment-wrapper-preview{
      width: 500px;
      height: 500px;
      border:1px solid #ccc;
  }
  </style>
<section class="container">
    <div class="container-page">
        <div class="row">
            <div class="col-sm-1"><!--left col-->
                @include('layout.superadmin_dashboard_menu')
            </div><!--/col-3-->
            <div class="col-sm-11">
                @include('partial/operation_message')
                <h2>
                    {{ $page_details['page_title'] }}
                </h2>
                <div class="row">
                    <div class="col-md-12">
                        <div class="form-group">
                            <?php
                            $get_background_url = $page_details['get_background_url'];
                            ?>
                            <select class="form-control" id="event_id" name="event_id" onchange="set_event_namebadge_template(this.value, '{{ url($get_background_url) }}');">
                                <option value="">Events List</option>
                                <?php
                                $events = get_table_data_by_table('events');
                                foreach ($events as $e) {
                                    ?>
                                    <option value="<?php echo $e->id ?>"><?php echo $e->title ?></option>
                                <?php } ?>
                            </select>
                        </div>
                    </div>
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
@include('modals/set_event_namebadge_template')
@include('partial/namebadge_template_fields_font_style')