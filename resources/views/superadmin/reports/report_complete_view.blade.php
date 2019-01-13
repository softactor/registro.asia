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
            <form id="custom_filter_report_form" action="{{ url('su/get_complete_report_pdf') }}" method="post">
                {{ csrf_field() }}
                <div class="col-sm-11">
                    <h3>Events</h3>
                    <div class="row">
                        <div class="col-md-12">                        
                            <div class="form-group">
                                <select class="form-control" id="event_id" name="event_id">
                                    <option value="">Please select</option>
                                    <?php
                                    $events = get_table_data_by_table('events');
                                    foreach ($events as $e) {
                                        ?>
                                        <option value="<?php echo $e->id ?>"><?php echo $e->title ?></option>
                                    <?php } ?>
                                </select>
                            </div>
                        </div>
                    </div>
                    <input class="button btn-primary btn-lg pull-right" type="submit" name="submit" value="Generate PDF">
                    <!--<a class="button btn-primary btn-lg pull-right" herf="{{ url('su/get_complete_report_pdf') }}">Generate</a>-->                    
                    <!--<button type="button" class="button btn-primary btn-lg pull-right" onclick="customFilterReport('{{ url('su/get_complete_report_pdf') }}');">Generate</button>-->                    
                </div><!--/tab-content-->
            </form>
        </div><!--/row-->  
        
    </div>
</section>
@endsection