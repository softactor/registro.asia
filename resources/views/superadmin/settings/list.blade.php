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
                @include('layout/operation_message') 
                <h2>
                    {{ $page_details['page_title'] }} List
                    <div class="pull-right">
                        <a href='{{ url($page_details['link_url']) }}'>{{ $page_details['link_title'] }}</a>
                    </div>
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
                        </tbody>
                    </table>
                </div>
            </div><!--/tab-content-->

        </div><!--/col-9-->        
    </div>
</section>
@endsection