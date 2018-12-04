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
            <form id="custom_filter_report_form" action="#">
                <div class="col-sm-11">
                    <h3>Custom filter report page</h3>
                    <div class="row">
                        <div class="col col-md-3">
                            <h4>Select Data Column</h4>                               
                            <div class="checkbox">
                                <label><input type="checkbox" name="dataColumn[]" value="salutation">Salutation</label>
                            </div>
                            <div class="checkbox">
                                <label><input type="checkbox" name="dataColumn[]" value="first_name">First name</label>
                            </div>
                            <div class="checkbox">
                                <label><input type="checkbox" name="dataColumn[]" value="last_name">Last name</label>
                            </div>
                            <div class="checkbox">
                                <label><input type="checkbox" name="dataColumn[]" value="company_name">Company name</label>
                            </div>
                            <div class="checkbox">
                                <label><input type="checkbox" name="dataColumn[]" value="gender">Gender</label>
                            </div>
                            <div class="checkbox">
                                <label><input type="checkbox" name="dataColumn[]" value="designation">Designation</label>
                            </div>
                            <div class="checkbox">
                                <label><input type="checkbox" name="dataColumn[]" value="mobile">Mobile</label>
                            </div>
                            <div class="checkbox">
                                <label><input type="checkbox" name="dataColumn[]" value="country_id">Country</label>
                            </div>
                            <div class="checkbox">
                                <label><input type="checkbox" name="dataColumn[]" value="tel">Telephone</label>
                            </div>
                            <div class="checkbox">
                                <label><input type="checkbox" name="dataColumn[]" value="fax">Fax</label>
                            </div>
                            <div class="checkbox">
                                <label><input type="checkbox" name="dataColumn[]" value="email">Email</label>
                            </div>
                            <div class="checkbox">
                                <label><input type="checkbox" name="dataColumn[]" value="serial_digit">Ticket</label>
                            </div>
                            <div class="checkbox">
                                <label><input type="checkbox" name="dataColumn[]" value="namebadge_user_label">Namebadge label</label>
                            </div>
                        </div>
                        <div class="col col-md-3">
                            <h4>Select Date & Event</h4>
                            <?php
                            $firstMonth = 'January ' . date('Y');
                            $lastMonth = 'December ' . date('Y');
                            $fts = strtotime($firstMonth);
                            $lts = strtotime($lastMonth);
                            ?>

                            <div class="form-group">
                                <input type="text" class="input-group form-control" id="start_date" placeholder="Enter start date" name="start_date" autocomplete="off" value="{{ date('01-m-Y', $fts) }}">
                            </div>
                            <div class="form-group">
                                <input type="text" class="input-group form-control" id="end_date" placeholder="Enter End date" name="end_date" autocomplete="off" value="{{ date('t-m-Y', $lts) }}">
                            </div>
                            <div class="form-group">
                                <select class="form-control" id="event_id" name="event_id">
                                    <option value="">Events List</option>
                                    <?php
                                    $events = get_table_data_by_table('events');
                                    foreach ($events as $e) {
                                        ?>
                                        <option value="<?php echo $e->id ?>"><?php echo $e->title ?></option>
                                    <?php } ?>
                                </select>
                            </div>

                        </div>
                        <div class="col col-md-3">
                            <h4>Select Report Generate Type</h4>
                            <div class="radio">
                                <label><input disabled type="radio" name="generate_type" value="chart_view">Chart view</label>
                            </div>
                            <div class="radio">
                                <label><input disabled type="radio" name="generate_type" value="export_view">Export view</label>
                            </div>
                        </div>
                    </div>
                    <button type="button" class="button btn-primary btn-lg pull-right" onclick="customFilterReport('{{ url('su/get_custom_filter_report') }}');">Generate</button>                    
                </div><!--/tab-content-->
            </form>
        </div><!--/row-->  
        
    </div>
</section>
@section('footer_js_scrip_area')
@parent
<script type="text/javascript" src="{{ asset('js/dashboard_report.js')}}"></script>
<script type="text/javascript">
    $( function() {
      $( "#start_date" ).datepicker({ dateFormat: 'dd-mm-yy', changeYear: true,defaultDate: new Date() });
      $( "#end_date" ).datepicker({ dateFormat: 'dd-mm-yy', changeYear: true,defaultDate: new Date() });
    });
    function customFilterReport(url){
        $.ajax({
            type: 'GET',
            url: url,
            dataType: 'json',
            data: $("#custom_filter_report_form").serialize(),
            success: function (response) {
                $('#report_custom_filter_list_data').modal('show');
                $('#generate_table').html(response.data);
            }
        })
    }
</script>
@endsection
@endsection
@include('modals.report_custom_filter_list_data')