<!--Extends parent app template-->
@extends('layout.app')
<!--Content insert section-->
@section('content')
<section class="container">
    <div class="container-page">				
        <div class="col-md-12">
            <?php
            $evens_list = get_table_data_by_table('events');
            if(isset($evens_list) && !empty($evens_list)){ ?>
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
                                <td><a href="{{ url('/client_registration/'.$list->event_url) }}">Registration</a></td>
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
        </div>
    </div>
</section>
@endsection