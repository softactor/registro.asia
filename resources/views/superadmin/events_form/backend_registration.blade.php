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
                    {{ $page_details['page_title'] }}
                    <div class="pull-right">
                        <a href='{{ url($page_details['link_url']) }}'>{{ $page_details['link_title'] }}</a>
                    </div>
                </h2>
                <?php
                    $data   =   [
                        'page_details'          =>  $page_details,
                        'events'                =>  $events,
                        'event_forms'           =>  $event_forms,
                        'step_form_selector'    =>  'profileSectionArea',
                    ];
                ?>
                @include('partial.registration_container', $data)
            </div><!--/tab-content-->

        </div><!--/col-9-->        
    </div>
</section>
@include('modals.name_badge_modal_containers')
@section('footer_js_scrip_area')
@parent
<script type="text/javascript" src="{{ asset('js/registration_process.js')}}"></script>
<script type="text/javascript" src="{{ asset('js/name_badge_prints.js')}}"></script>
@endsection
@endsection