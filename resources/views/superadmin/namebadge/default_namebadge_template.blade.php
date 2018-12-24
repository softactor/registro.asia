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
                        <div class="row">
                            <div class="col-md-6">
                                @if ($errors->has('background'))
                                <div class="alert-error">{{ $errors->first('background') }}</div>
                                @endif
                                <label for="namebadge_height">Default Portrait_1:</label>
                                <input type="file" class="form-control" name="default_Portrait_1">
                                <span class="text-info" style="font-size: 18px; font-style: italic;">Size is <b>105 × 75</b> millimeters</span>
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
                        <div class="row">
                            <div class="col-md-6">
                                @if ($errors->has('background'))
                                <div class="alert-error">{{ $errors->first('background') }}</div>
                                @endif
                                <label for="namebadge_height">Default Portrait_2:</label>
                                <input type="file" class="form-control" name="default_Portrait_2">
                                <span class="text-info" style="font-size: 18px; font-style: italic;">Size is <b>135 × 90</b> millimeters</span>
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
                        <div class="row">
                            <div class="col-md-6">
                                @if ($errors->has('background'))
                                <div class="alert-error">{{ $errors->first('background') }}</div>
                                @endif
                                <label for="namebadge_height">Landscape:</label>
                                <input type="file" class="form-control" name="landscape">
                                <span class="text-info" style="font-size: 18px; font-style: italic;">Size is <b>75 × 105</b> millimeters</span>
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
                    <input type="submit" id="config_saved_button" name='create_event' value="Create" class="btn btn-default">
                </form>
            </div><!--/tab-content-->

        </div><!--/col-9-->        
    </div>
</section>
@endsection