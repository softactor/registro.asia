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
                    <div class="pull-right">
                        <a href='{{ url($page_details['link_url']) }}'>{{ $page_details['link_title'] }}</a>
                    </div>
                </h2>
                <?php if(isset($evens_list) && !empty($evens_list)){ ?>
                <div class="table-responsive">          
                    <table class="table">
                        <thead>
                            <tr>
                                <th>#</th>
                                <th>Title</th>
                                <th>Organizer</th>
                                <th>Venue name</th>
                                <th>Event url</th>
                                <th>Action</th>
                            </tr>
                        </thead>
                        <tbody>
                            <?php
                                $count  =   1; 
                                foreach($evens_list as $list){
                            ?>
                            <tr>
                                <td><?php echo $count; ?></td>
                                <td><?php echo $list->title; ?></td>
                                <td><?php echo $list->organizer; ?></td>
                                <td><?php echo $list->venue_name; ?></td>
                                <td><?php echo $list->event_url; ?></td>
                                <td><a href="{{ url('su/edit_event/'.$list->event_url) }}">Edit</a>|<a href="">Delete</a></td>
                            </tr>
                                <?php $count++; } ?>
                        </tbody>
                    </table>
                </div>
                <?php }else{ ?>
                <div class="alert alert-info" id='info_message'>
                        <strong>Sorry!</strong> There is no data.
                    </div>
                <?php } ?>
            </div><!--/tab-content-->

        </div><!--/col-9-->        
    </div>
</section>
@endsection