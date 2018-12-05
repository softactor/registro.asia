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
                <div class="row">
                    <div class="col-md-4">
                        <!-- Widget: user widget style 1 -->
                        <div class="box box-widget widget-user-2">
                            <!-- Add the bg color to the header using any of the bg-* classes -->
                            <div class="widget-user-header bg-yellow">
                                <h3 class="widget-user-username">Report details</h3>
                            </div>
                            <div class="box-footer no-padding">
                                <ul class="nav nav-stacked">
                                    <li><a href="#">Event wise</a></li>
                                    <li><a href="#">Date wise</a></li>
                                    <li><a href="{{ url('su/reports_grphic_view')}}">Chart View</a></li>
                                    <li><a href="{{ url('su/reports_custom_filter')}}">Custom filter</a></li>
                                </ul>
                            </div>
                        </div>
                        <!-- /.widget-user -->
                    </div>
                    <div class="col-md-4">
                        <!-- Widget: user widget style 1 -->
                        <div class="box box-widget widget-user-2">
                            @include('superadmin.reports.report_at_a_glance')
                        </div>
                        <!-- /.widget-user -->
                    </div>
                    <div class="col-md-4">
                        <!-- Report: last month -->
                        <div class="box box-widget widget-user-2">
                            @include('superadmin.reports.report_last_month')                            
                        </div>
                        <!-- /Report: last month -->
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-4">
                        <!-- Report: last day -->
                        <div class="box box-widget widget-user-2">
                            @include('superadmin.reports.report_last_day')
                        </div>
                        <!-- /Report: last day -->
                    </div>
                    <div class="col-md-4">
                        <!-- Report: Today -->
                        <div class="box box-widget widget-user-2">
                            @include('superadmin.reports.report_today')
                        </div>
                        <!-- /Report: Today -->
                    </div>
                </div>
            </div><!--/tab-content-->

        </div><!--/col-9-->        
    </div>
</section>
@endsection