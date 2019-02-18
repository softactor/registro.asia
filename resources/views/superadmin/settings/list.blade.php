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
                    {{ $page_details['page_title'] }} List
                </h2>
                <div class="table-responsive">          
                    <table class="table">
                        <thead>
                            <tr>
                                <th>#</th>
                                <th>Name</th>
                                <th>Operation</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td>1</td>
                                <td>Registration CSV Format</td>
                                <td><a href="{{ asset('csv/registration.csv') }}">Download</a></td>
                            </tr>
                            <tr>
                                <td>2</td>
                                <td>Print layout configuration</td>
                                <td><a href="#"  data-toggle="modal" data-target="#print_layout_template">Print layout configuration</a></td>
                            </tr>
                            <tr>
                                <td>3</td>
                                <td>Name badge label</td>
                                <td><a href="#"  data-toggle="modal" data-target="#name_badge_label">Name badge label</a></td>
                            </tr>
                            <tr>
                                <td>4</td>
                                <td>Default Namebadge Template</td>
                                <td><a href="{{ url('su/default_namebadge_template') }}">Upload</a></td>
                            </tr>
                            <tr>
                                <td>5</td>
                                <td>Email Editor</td>
                                <td><a href="{{ url('su/event_wise_mail_composer') }}">Compose</a></td>
                            </tr>
                            <tr>
                                <td>6</td>
                                <td>PDF Design</td>
                                <td><a href="{{ url('su/event_wise_pdf_composer') }}">Compose</a></td>
                            </tr>
                            <tr>
                                <td>7</td>
                                <td>Event-Email Filtering</td>
                                <td><a href="#"  data-toggle="modal" data-target="#event_wise_email_filtering">Set</a></td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </div><!--/tab-content-->

        </div><!--/col-9-->        
    </div>
</section>
@section('footer_js_scrip_area')
@parent
<script type="text/javascript" src="{{ asset('js/settings.js')}}"></script>
@endsection
@endsection
@include('partial/print_layout_template')
@include('partial/name_badge_label')
@include('partial/event_wise_email_filtering')