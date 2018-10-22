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
                </h2>
                <?php if(isset($evens_list) && !empty($evens_list)){ ?>
                <div class="table-responsive">          
                    <table class="table">
                        <thead>
                            <tr>
                                <th>#</th>
                                <th>Title</th>
                                <th>Event url</th>
                                <th>Total Registration</th>
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
                                <td><?php echo $list->event_url; ?></td>
                                <td>
                                    <?php
                                        $param['table'] = 'event_business_owners';
                                        $param['field'] = 'owners_numbers';
                                        $param['where'] = [
                                            'event_id' => $list->id
                                        ];
                                        echo ((getTableFieldsSum($param)->total)? getTableFieldsSum($param)->total : 'Still no registration');
                                    ?>
                                </td>
                                <td>
                                    <a href="{{ url('/su/registration_details_view/'.$list->id) }}">Show</a>
                                </td>
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