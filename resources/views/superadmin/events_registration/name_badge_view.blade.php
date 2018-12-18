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
                @include('layout/operation_message') 
                <h2>
                    Name badge search
                </h2>
                @include('search.name_badge_search', $page_details)
                <div class="box-body"></div>
            </div><!--/tab-content-->
        </div><!--/col-9--> 
    </div>
</section>
@section('footer_js_scrip_area')
@parent
<script type="text/javascript" src="{{ asset('js/printThis.js')}}"></script>
<script type="text/javascript" src="{{ asset('js/name_badge_prints.js')}}"></script>
@endsection
@endsection
@include('modals.registration_edit_modal')
@include('modals.name_badge_modal_containers')