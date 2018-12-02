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
                                    <li><a href="#">Ticket wise</a></li>
                                    <li><a href="#">Custom filter</a></li>
                                </ul>
                            </div>
                        </div>
                        <!-- /.widget-user -->
                    </div>
                    <div class="col-md-4">
                        <!-- Widget: user widget style 1 -->
                        <div class="box box-widget widget-user-2">
                            <!-- Add the bg color to the header using any of the bg-* classes -->
                            <div class="widget-user-header bg-yellow">
                                <h3 class="widget-user-username">At a glance</h3>
                            </div>
                            <div class="box-footer no-padding">
                                <ul class="nav nav-stacked">
                                    <li><a href="#">Total Events <span class="pull-right badge bg-blue">31</span></a></li>
                                    <li><a href="#">Total Registration <span class="pull-right badge bg-aqua">5</span></a></li>
                                    <li><a href="#">Online Registration <span class="pull-right badge bg-green">12</span></a></li>
                                    <li><a href="#">Onsite Registration <span class="pull-right badge bg-red">842</span></a></li>
                                    <li><a href="#">Total Imports <span class="pull-right badge bg-red">842</span></a></li>
                                </ul>
                            </div>
                        </div>
                        <!-- /.widget-user -->
                    </div>
                    <div class="col-md-4">
                        <!-- Widget: user widget style 1 -->
                        <div class="box box-widget widget-user-2">
                            <!-- Add the bg color to the header using any of the bg-* classes -->
                            <div class="widget-user-header bg-yellow">
                                <h3 class="widget-user-username">Last month registration</h3>
                            </div>
                            <div class="box-footer no-padding">
                                <ul class="nav nav-stacked">
                                    <li><a href="#">Total Events <span class="pull-right badge bg-blue">31</span></a></li>
                                    <li><a href="#">Total Registration <span class="pull-right badge bg-aqua">5</span></a></li>
                                    <li><a href="#">Online Registration <span class="pull-right badge bg-green">12</span></a></li>
                                    <li><a href="#">Onsite Registration <span class="pull-right badge bg-red">842</span></a></li>
                                    <li><a href="#">Total Imports <span class="pull-right badge bg-red">842</span></a></li>
                                </ul>
                            </div>
                        </div>
                        <!-- /.widget-user -->
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-4">
                        <!-- Widget: user widget style 1 -->
                        <div class="box box-widget widget-user-2">
                            <!-- Add the bg color to the header using any of the bg-* classes -->
                            <div class="widget-user-header bg-yellow">
                                <h3 class="widget-user-username">Last day registration</h3>
                            </div>
                            <div class="box-footer no-padding">
                                <ul class="nav nav-stacked">
                                    <li><a href="#">Total Events <span class="pull-right badge bg-blue">31</span></a></li>
                                    <li><a href="#">Total Registration <span class="pull-right badge bg-aqua">5</span></a></li>
                                    <li><a href="#">Online Registration <span class="pull-right badge bg-green">12</span></a></li>
                                    <li><a href="#">Onsite Registration <span class="pull-right badge bg-red">842</span></a></li>
                                    <li><a href="#">Total Imports <span class="pull-right badge bg-red">842</span></a></li>
                                </ul>
                            </div>
                        </div>
                        <!-- /.widget-user -->
                    </div>
                    <div class="col-md-4">
                        <!-- Widget: user widget style 1 -->
                        <div class="box box-widget widget-user-2">
                            <!-- Add the bg color to the header using any of the bg-* classes -->
                            <div class="widget-user-header bg-yellow">
                                <h3 class="widget-user-username">Today registration</h3>
                            </div>
                            <div class="box-footer no-padding">
                                <ul class="nav nav-stacked">
                                    <li><a href="#">Total Events <span class="pull-right badge bg-blue">31</span></a></li>
                                    <li><a href="#">Total Registration <span class="pull-right badge bg-aqua">5</span></a></li>
                                    <li><a href="#">Online Registration <span class="pull-right badge bg-green">12</span></a></li>
                                    <li><a href="#">Onsite Registration <span class="pull-right badge bg-red">842</span></a></li>
                                    <li><a href="#">Total Imports <span class="pull-right badge bg-red">842</span></a></li>
                                </ul>
                            </div>
                        </div>
                        <!-- /.widget-user -->
                    </div>
                </div>
            </div><!--/tab-content-->

        </div><!--/col-9-->        
    </div>
</section>
@endsection