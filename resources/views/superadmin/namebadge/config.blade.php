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
                        @if ($errors->has('event_id'))
                        <div class="alert-error">{{ $errors->first('event_id') }}</div>
                        @endif
                        <select class="form-control" id="event_id" name="event_id">
                            <option value="">Events List</option>
                            <?php
                                foreach($page_details['events'] as $e){
                            ?>
                            <option value="<?php echo $e->id ?>"{{(old('event_id')==$e->id)? 'selected':''}}><?php echo $e->title ?></option>
                            <?php } ?>
                        </select>
                    </div>
                    <div class="form-group">
                        @if ($errors->has('measure_unit'))
                        <div class="alert-error">{{ $errors->first('measure_unit') }}</div>
                        @endif
                        <select class="form-control" id="measure_unit" name="measure_unit">
                            <option value="">Page unit</option>
                            <?php
                                $settings_val    =   get_settings_value('units');
                                foreach($settings_val as $val){
                            ?>
                            <option value="<?php echo $val ?>"{{(old('units')==$val)? 'selected':''}}><?php echo $val ?></option>
                            <?php } ?>
                        </select>
                    </div>
                    <div class="form-group">
                        @if ($errors->has('namebadge_width'))
                        <div class="alert-error">{{ $errors->first('namebadge_width') }}</div>
                        @endif
                        <label for="namebadge_width">Page width:</label>
                        <input type="text" class="form-control" id="namebadge_width" placeholder="Enter width" name="namebadge_width" value="{{ old('area_name') }}">
                    </div>
                    <div class="form-group">
                        @if ($errors->has('namebadge_height'))
                        <div class="alert-error">{{ $errors->first('namebadge_height') }}</div>
                        @endif
                        <label for="namebadge_height">Page height:</label>
                        <input type="text" class="form-control" id="namebadge_height" placeholder="Enter height" name="namebadge_height" value="{{ old('area_name') }}">
                    </div>
                    <div class="form-group">
                        @if ($errors->has('namebadge_orientation'))
                        <div class="alert-error">{{ $errors->first('namebadge_orientation') }}</div>
                        @endif
                        <select class="form-control" id="namebadge_orientation" name="namebadge_orientation">
                            <option value="">Page orientation</option>
                            <?php
                                $settings_val    =   get_settings_value('page orientation');
                                foreach($settings_val as $val){
                            ?>
                            <option value="<?php echo $val ?>"{{(old('namebadge_orientation')==$val)? 'selected':''}}><?php echo $val ?></option>
                            <?php } ?>
                        </select>
                    </div>
                    <div class="form-group">
                        <label for="namebadge_height">File:</label>
                        <input type="file" class="form-control" id="background" name="background">
                    </div>
                    <input type="submit" name='create_event' value="Create" class="btn btn-default">
                </form>
            </div><!--/tab-content-->

        </div><!--/col-9-->        
    </div>
</section>
@endsection