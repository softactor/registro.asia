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
                                </tr>
                            </thead>
                            <tbody>
                                <?php foreach($csv_reg_data as $key=>$data){ ?>
                                <tr>
                                    <td>{{$key+1}}</td>
                                    <td><span class='edit_text'>{{ $data[0] }}</span></td>
                                    <td><span class='edit_text'>{{ $data[1] }}</span></td>
                                    <td><span class='edit_text'>{{ $data[2] }}</span></td>
                                    <td><span class='edit_text'>{{ $data[3] }}</span></td>
                                    <td><span class='edit_text'>{{ $data[4] }}</span></td>
                                    <td><span class='edit_text'>{{ $data[5] }}</span></td>
                                    <td><span class='edit_text'>{{ $data[6] }}</span></td>
                                    <td><span class='edit_text'>{{ $data[7] }}</span></td>
                                    <td><span class='edit_text'>{{ $data[8] }}</span></td>
                                    <td><span class='edit_text'>{{ $data[9] }}</span></td>
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