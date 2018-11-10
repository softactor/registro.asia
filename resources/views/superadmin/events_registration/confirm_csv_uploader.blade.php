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
                <form method="post" action="{{ url('su/backend/registration/csv_import') }}" enctype='multipart/form-data'>
                    {{ csrf_field() }}
                    <div class="table-responsive">          
                        <table class="table table-hover" id='csv_data'>
                            <thead>
                                <tr>
                                    <th><input type="checkbox" class="check" name="checkall" id="checkall" value="checkall"></th>
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
                                    <th>Action</th>
                                </tr>
                            </thead>
                            <tbody>
                                <?php
                                    $param['table'] =   'event_business_owners_details';
                                    $checkWhereParam = [
                                        ['event_id',            '=',     $page_details['events']->id],
                                        ['business_owner_id',   '=',    $page_details['business_owner_id']],
                                        ['is_confirmed',        '=',    0],
                                    ];
                                    $param['where'] =   $checkWhereParam;
                                    $csv_reg_data   =   get_table_data_by_clause($param);
                                    foreach($csv_reg_data as $key=>$data){
                                ?>
                                <tr>
                                    <td><input type="checkbox" name="item_child[]" id="item_child_check_{{$data->id}}" value="{{$data->id}}"></td>
                                    <td>{{$key+1}}</td>
                                    <td><span class='edit_text'>{{ $data->salutation }}</span></td>                                    
                                    <td><span class='edit_text'>{{ $data->first_name }}</span></td>
                                    <td><span class='edit_text'>{{ $data->last_name }}</span></td>
                                    <td><span class='edit_text'>{{ $data->company_name }}</span></td>
                                    <td><span class='edit_text'>{{ $data->company_address }}</span></td>
                                    <td><span class='edit_text'>{{ $data->gender }}</span></td>
                                    <td><span class='edit_text'>{{ $data->designation }}</span></td>
                                    <td><span class='edit_text'>{{ $data->mobile }}</span></td>
                                    <td><span class='edit_text'>{{ $data->country_id }}</span></td>
                                    <td><span class='edit_text'>{{ $data->email }}</span></td>
                                    <th><button type="button" class="btn btn-sm" onclick="csv_upload_confirm('{{ url('su/backend/csv_data/store') }}');">Conform</button></th>
                                </tr>
                                <?php } ?>
                            </tbody>
                        </table>
                    </div>
                    <input type="hidden" id='event_id' name="event_id" value="<?php echo $page_details['events']->id ?>" />
                    <button type="button" class="btn btn-default" onclick="csv_upload_confirm('{{ url('su/backend/csv_data/store') }}');">Confirm</button>
                </form>
            </div><!--/tab-content-->

        </div><!--/col-9-->        
    </div>
</section>
@endsection