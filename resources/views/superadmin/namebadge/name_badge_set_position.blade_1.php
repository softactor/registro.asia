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
                            <select class="form-control" id="event_id" name="event_id" onchange="set_event_namebadge_background(this.value, '{{ url($get_background_url) }}');">
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
                <div class="row">
                    <div class="col-md-12">
                        <div class="form-group">
                            <select class="form-control" id="image_path" name="image_path" onchange="update_event_namebadge_background(this.value);">
                                <option value="">Template List</option>
                            </select>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-12">
                        <div class="row">                            
                            <div class="col-md-2">
                                <div class="ui-widget-content dropable_object draggable" data-absulate-left="1px" data-absulate-top="1px" data-left="10px" data-top="15px" id="serial_digit">Serial digit</div>
                                <div class="ui-widget-content dropable_object draggable" data-absulate-left="1px" data-absulate-top="1px" data-left="10px" data-top="15px" id="qrcode_path">QRcode</div>
                                <div class="ui-widget-content dropable_object draggable" data-absulate-left="1px" data-absulate-top="1px" data-left="10px" data-top="15px" id="salutation">Salutation</div>
                                <div class="ui-widget-content dropable_object draggable" data-absulate-left="" data-absulate-top="" data-left="11px" data-top="12px" id="first_name">First Name</div>
                                <div class="ui-widget-content dropable_object draggable" data-absulate-left="" data-absulate-top="" data-left="12px" data-top="13px" id="last_name">Last Name</div>
                                <div class="ui-widget-content dropable_object draggable" data-absulate-left="" data-absulate-top="" data-left="13px" data-top="14px" id="company_name">Company Name</div>
                                <div class="ui-widget-content dropable_object draggable" data-absulate-left="" data-absulate-top="" data-left="14px" data-top="15px" id="gender">Gender</div>
                                <div class="ui-widget-content dropable_object draggable" data-absulate-left="" data-absulate-top="" data-left="16px" data-top="17px" id="mobile">Mobile</div>
                                <div class="ui-widget-content dropable_object draggable" data-absulate-left="" data-absulate-top="" data-left="18px" data-top="19" id="email">Email</div>
                                <div class="ui-widget-content dropable_object draggable" data-absulate-left="" data-absulate-top="" data-left="18px" data-top="19" id="namebadge_user_label">Namebadge user label</div>
                            </div>
                            <div class="col-md-5">
                                <div id="containment-wrapper">
                                    <div class="center_line"></div>
                                    <div id="content_loader">
                                        <img src="{{ asset('images/content_loading.gif') }}" alt="Wait" />
                                    </div>                    
                                </div>
                                    <?php
                                        $position_store =   url($page_details['position_store']);
                                    ?>
                                    <input type="hidden" id="namebadge_bg_image_path" name="namebadge_bg_image_path" value="{{ $page_details['background_image_path'] }}" />
                                    <input type="hidden" id="position_store" name="position_store" value="{{ $position_store }}" />
                                    <input type="hidden" id="name_badge_id" name="name_badge_id" value="" />
                                <button id="save" onclick="save_position()">Save Position</button>
                            </div>
                            <div class="col-md-5">
                                <div id="containment-wrapper-preview">
                                    <div class="center_line"></div>
                                    <div class="live_preview_fields" style="position: absolute;" id="preview_serial_digit">Serial digit</div>
                                    <div class="live_preview_fields" style="position: absolute;" id="preview_qrcode_path">QRcode</div>
                                    <div class="live_preview_fields" style="position: absolute;" id="preview_salutation">Salutation</div>
                                    <div class="live_preview_fields" style="position: absolute;" id="preview_first_name">First Name</div>
                                    <div class="live_preview_fields" style="position: absolute;" id="preview_last_name">Last Name</div>
                                    <div class="live_preview_fields" style="position: absolute;" id="preview_company_name">Company Name</div>
                                    <div class="live_preview_fields" style="position: absolute;" id="preview_gender">Gender</div>
                                    <div class="live_preview_fields" style="position: absolute;" id="preview_mobile">Mobile</div>
                                    <div class="live_preview_fields" style="position: absolute;" id="preview_email">Email</div>
                                    <div class="live_preview_fields" style="position: absolute;" id="preview_namebadge_user_label">Visitor</div>
                                </div>
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
@include('partial/namebadge_template_fields_font_style')