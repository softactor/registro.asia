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
                <h2>
                    {{ $page_details['page_title'] }} Create
                    <div class="pull-right">
                        <a href='{{ url($page_details['link_url']) }}'>{{ $page_details['link_title'] }}</a>
                    </div>
                </h2>
                <h4>{{ $page_details['base_url'] }}</h4>
                <form action="{{ url($page_details['form_url']) }}" method="post">
                    {{ csrf_field() }}
                    <div class="form-group">
                        <label for="title">Label title:</label>
                        <input type="text" class="form-control" id="title" placeholder="Enter title" name="title">
                    </div>
                    <div id="build-wrap"></div>
                    <div id="fb-editor"></div>
                    <div class="setDataWrap">
                        <input type="hidden" id="event_id" value="{{$events->id}}" >
                        <!--<button id="getXML" type="button">Get XML Data</button>-->
                    </div>
                </form>                
                <button style="margin-bottom: 2%" class="btn btn-info" id="getJSON" type="button" onclick="createForm('{{ url("su/store_events_form") }}', '{{ url("su/event_form") }}');">Create</button>
            </div><!--/tab-content-->

        </div><!--/col-9-->        
    </div>
</section>
@endsection