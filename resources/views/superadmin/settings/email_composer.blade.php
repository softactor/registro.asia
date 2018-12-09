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
                    {{ $page_details['page_title'] }} Compose
                </h2>
                <form action="{{ url($page_details['form_url']) }}" method="post">
                    {{ csrf_field() }}
                    <div class="form-group">
                        <label for="sel1">Events:</label>
                        <select class="form-control" id="event_id" name="event_id" onchange="get_email_text(this.value, '{{ url('su/get_email_text') }}');">
                            <option value="">Events List</option>
                            <?php
                            $events = get_table_data_by_table('events');
                            foreach ($events as $e) {
                                ?>
                                <option value="<?php echo $e->id ?>"><?php echo $e->title ?></option>
                            <?php } ?>
                        </select>
                    </div>
                    <div class="form-group">
                        <label for="comment">Mail body:</label>
                        <textarea class="form-control rich_editor" rows="5" name="mail_body" id="mail_body"></textarea>
                    </div>
                    <input type="submit" name="submit" value="Save" class="btn btn-default">
                </form>                
                
            </div><!--/tab-content-->

        </div><!--/col-9-->        
    </div>
</section>
@section('footer_js_scrip_area')
@parent
<script type="text/javascript" src="{{ asset('js/settings.js')}}"></script>
@endsection
@endsection