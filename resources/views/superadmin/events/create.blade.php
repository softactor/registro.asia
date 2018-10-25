<!--Extends parent app template-->
@extends('layout.app')
<!--Content insert section-->
@section('content')
<section class="container">
    <div class="container-page">
        <div class="row">
            <div class="col-sm-3"><!--left col-->
                @include('layout.superadmin_dashboard_menu')
            </div><!--/col-3-->
            <div class="col-sm-9">
                <h2>
                    {{ $page_details['page_title'] }} Create
                    <div class="pull-right">
                        <a href='{{ url($page_details['link_url']) }}'>{{ $page_details['link_title'] }}</a>
                    </div>
                </h2>
                <form action="{{ url($page_details['form_url']) }}" method="post">
                    {{ csrf_field() }}
                    <div class="form-group">
                        <label for="title">Title:</label>
                        <input type="text" class="form-control" id="title" placeholder="Enter title" name="title">
                    </div>
                    <div class="form-group">
                        <label for="comment">Embedded Code: <button type="button" class="btn btn-sm" onclick="generateEmbeddedEventsUrl('{{ url("su/generateEmbeddedEventsUrl")}}');">Create</button></label>
                        <textarea class="form-control" rows="5" id="iframe_events_url" name="iframe_events_url"></textarea>
                    </div>

                    <div class="form-group">
                        <label for="organizer">Organizer:</label>
                        <input type="text" class="form-control" id="organizer" placeholder="Enter Organizer" name="organizer">
                    </div>
                    <div class="form-group">
                        <label for="start_date">Start date:</label>
                        <input type="text" class="form-control" id="event_start_date" placeholder="Enter start date" name="start_date">
                    </div>
                    <div class="form-group">
                        <label for="end_date">End date:</label>
                        <input type="text" class="form-control" id="event_end_date" placeholder="Enter End date" name="end_date">
                    </div>
                    <div class="form-group">
                        <label for="venue_name">Venue name:</label>
                        <input type="text" class="form-control" id="venue_name" placeholder="Enter Venue name" name="venue_name">
                    </div>
                    <div class="form-group">
                        <label for="venue_address">Venue address:</label>
                        <input type="text" class="form-control" id="venue_address" placeholder="Enter Venue address" name="venue_address">
                    </div>
                    <input type="submit" name='create_event' value="Create" class="btn btn-default">
                </form>
            </div><!--/tab-content-->

        </div><!--/col-9-->        
    </div>
</section>
@endsection