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
                    {{ $page_details['page_title'] }} for {{ $page_details['events']->title }}
                </h2>
                    {{ csrf_field() }}
                    <div class="table-responsive">          
                        <table class="table table-hover" id='csv_data'>
                            <thead>
                                <tr>
                                    <th>#</th>
                                    <th>Salutation</th>
                                    <th>First Name</th>
                                    <th>Last Name</th>
                                    <th>Company</th>
                                    <th>Address</th>
                                    <th>Gender</th>
                                    <th>Designation</th>
                                    <th>Mobile</th>
                                    <th>Country</th>
                                    <th>Email</th>
                                    <th>Status</th>
                                </tr>
                            </thead>
                            <tbody>
                                <?php foreach($page_details['tempData'] as $key=>$data){ ?>
                                <tr>
                                    <td>{{ $key+1 }}</td>
                                    <td><span class='import_text'>{{ $data->salutation }}</span></td>
                                    <td><span class='import_text'>{{ $data->first_name }}</span></td>
                                    <td><span class='import_text'>{{ $data->last_name }}</span></td>
                                    <td><span class='import_text'>{{ $data->company_name }}</span></td>
                                    <td><span class='import_text'>{{ $data->company_address }}</span></td>
                                    <td><span class='import_text'>{{ $data->gender }}</span></td>
                                    <td><span class='import_text'>{{ $data->designation }}</span></td>
                                    <td><span class='import_text'>{{ $data->mobile }}</span></td>
                                    <td><span class='import_text'>{{ $data->country_id }}</span></td>
                                    <td><span class='import_text'>{{ $data->email }}</span></td>
                                    <td>
                                        <span class='import_text'>
                                            <?php if(!$data->status){ ?>
                                            <span class="label label-warning">Pending</span>
                                            <?php }else{ ?>
                                            <span class="label label-success">Done</span>
                                            <?php } ?>
                                                
                                        </span>
                                    </td>
                                </tr>
                                <?php } ?>
                            </tbody>
                        </table>
                    </div>
            </div><!--/tab-content-->

        </div><!--/col-9-->        
    </div>
</section>
@endsection