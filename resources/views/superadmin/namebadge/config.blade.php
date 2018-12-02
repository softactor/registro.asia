<!--Extends parent app template-->
@extends('layout.app')
<!--Content insert section-->
@section('content')
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
                <form action="{{ url($page_details['form_url']) }}" method="post" enctype="multipart/form-data">
                    {{ csrf_field() }}
                    <div class="form-group">
                        <?php
                            $url    =   url($page_details['previous_config_url']);
                        ?>
                        @if ($errors->has('event_id'))
                        <div class="alert-error">{{ $errors->first('event_id') }}</div>
                        @endif
                        <select class="form-control" id="event_id" name="event_id" onchange="getNameBadgeConfigDetails(this.value, '{{$url}}');">
                            <option value="">Events List</option>
                            <?php
                                foreach($page_details['events'] as $e){
                            ?>
                            <option value="<?php echo $e->id ?>"{{(old('event_id')==$e->id)? 'selected':''}}><?php echo $e->title ?></option>
                            <?php } ?>
                        </select>
                    </div>
                    <div class="form-group">
                        @if ($errors->has('namebadge_width'))
                        <div class="alert-error">{{ $errors->first('namebadge_width') }}</div>
                        @endif
                        <label for="namebadge_width">Page width (mm):</label>
                        <input type="text" class="form-control" id="namebadge_width" placeholder="Enter width" name="namebadge_width" value="{{ old('namebadge_width') }}">
                    </div>
                    <div class="form-group">
                        @if ($errors->has('namebadge_height'))
                        <div class="alert-error">{{ $errors->first('namebadge_height') }}</div>
                        @endif
                        <label for="namebadge_height">Page height (mm):</label>
                        <input type="text" class="form-control" id="namebadge_height" placeholder="Enter height" name="namebadge_height" value="{{ old('namebadge_height') }}">
                    </div>
                    <span id="saved_templates_area"></span>
                    <div id="template_area">
                        <div class="form-group">
                            @if ($errors->has('namebadge_width'))
                            <div class="alert-error">{{ $errors->first('namebadge_width') }}</div>
                            @endif
                            <label for="namebadge_width">Template Name:</label>
                            <input type="text" class="form-control" placeholder="Enter template name" name="template_name[]" value="">
                        </div>
                        <div class="form-group">
                            <div class="row">
                                <div class="col-md-6">
                                    @if ($errors->has('background'))
                                    <div class="alert-error">{{ $errors->first('background') }}</div>
                                    @endif
                                    <label for="namebadge_height">File:</label>
                                    <input type="file" class="form-control" name="background[]">
                                    <span class="text-info" style="font-size: 18px; font-style: italic;">Maximum allowed size is <b>210 × 297</b> millimeters</span>
                                </div>
                                <div class="col-md-6">
                                    <div id="content_loader">
                                        <img src="{{ asset('images/content_loading.gif') }}" alt="Wait" />
                                    </div>
                                    <div id="previous_bg_template" style="display: none;">
                                        <img id="previous_bg_template_img" class="img-responsive" src="" />
                                    </div>
                                </div>
                            </div>                        
                        </div>
                        <div class="form-group col-lg-12">
                            <button type="button" class="btn btn-primary pull-right" onclick="add_more_templates();">Add more template</button>
                        </div>
                    </div>
                    <span id="cloneItem"></span>                    
                    <input type="submit" id="config_saved_button" name='create_event' value="Create" class="btn btn-default">
                </form>
            </div><!--/tab-content-->

        </div><!--/col-9-->        
    </div>
</section>
@section('footer_js_scrip_area')
@parent
<script type="text/javascript" src="{{ asset('js/name_badge_position.js')}}"></script>
@endsection
@endsection