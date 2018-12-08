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
                                <label>
                                    <input type="radio" name="generate_type" value="chart">Chart view
                                </label>
                            </div>
                            <span id="barchart_fields"></span>
                            <div class="radio">
                                <label>
                                    <input checked type="radio" name="generate_type" value="export">Export view
                                </label>
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
                $.each(response.chartData, function( index, value ) {
                    var chartParam = {
                        chart_type          : "bar",
                        selector_id         : "dynamic_form_events_"+index,
                        name                : value.name,
                        xdata               : value.xdata,
                        ydata               : value.ydata,
                    };
                events_dynamic_form_report(chartParam);
                });
                run_yearly_events_report();
                run_yearly_events_registration_type_report();
            }
        })
    }
    
    function getEventCustomForm(generate_type, url){
        if(generate_type == 'chart'){
            if(!$("#event_id").val()){
                var errorString     =   '<span class="alert alert-danger">Please select an event first!</span>';
                $('#barchart_fields').html(errorString);
            }else{
                $.ajax({
                    type: 'GET',
                    url: url,
                    dataType: 'json',
                    data: 'event_id='+ $("#event_id").val(),
                    success: function (response) {
                        $('#barchart_fields').html(response.data);
                    }
                })
            }
        }
    }
    function run_yearly_events_report(){
        var required_param = {
            dataType    : "yearly_events",
            startDate   : $('#start_date').val(),
            endDate     : $('#end_date').val(),
            event_id    : $('#event_id').val(),
        };
        $.ajax({
            type: "GET",
            url: "/get_events_chart_data",
            dataType: "JSON",
            data: 'param=' + JSON.stringify(required_param),
            success: function (response) {
                console.log(response.result);
                var chartParam = {
                    selector_id         : "yearly_events",
                    chart_title         : "Total </n>Events</n> 2018",
                    data                : response.result,
                };
                yearly_events_report(chartParam);
            }// end of success
        }); // end of ajax call
    }
    function run_yearly_events_registration_type_report(){
        //yearly_events
        var required_param = {
            dataType    : "yearly_events_reg_type",
            startDate   : $('#start_date').val(),
            endDate     : $('#end_date').val(),
            event_id     : $('#event_id').val(),
        };
        $.ajax({
            type: "GET",
            url: "/get_events_chart_data",
            dataType: "JSON",
            data: 'param=' + JSON.stringify(required_param),
            success: function (response) {
                var chartParam = {
                    selector_id         : "yearly_events_type",
                    chart_title         : "Total </n>Registration</n> 2018",
                    data                : response.result,
                };
                yearly_events_registration_type_report(chartParam);
               // for gender 
                var chartParam = {
                    selector_id         : "gender_pie_chart",
                    chart_title         : "Gender Chart View",
                    data                : response.others_reports.gender,
                };
                yearly_events_registration_type_report(chartParam);
                
                // for designation
                var chartParam = {
                    selector_id         : "designation_pie_chart",
                    chart_title         : "Designation Chart View",
                    data                : response.others_reports.designation,
                };
                yearly_events_registration_type_report(chartParam);
                
                // for country
                var chartParam = {
                    selector_id         : "country_pie_chart",
                    chart_title         : "Country Chart View",
                    data                : response.others_reports.country_id,
                };
                yearly_events_registration_type_report(chartParam);
                
                // for namebadge label
                var chartParam = {
                    selector_id         : "namebadge_label_pie_chart",
                    chart_title         : "Name Badge Chart View",
                    data                : response.others_reports.namebadge_user_label,
                };
                yearly_events_registration_type_report(chartParam);
            }// end of success
        }); // end of ajax call
    }
    function showReport(){
        run_yearly_events_report();
        run_yearly_events_registration_type_report();
    }
    function printExecuteSingleNameBadge(url, print_id){
        $('#printBody').printThis();   
    }
    function documents_print(print_id){
        $('#'+print_id).printThis(); 
    }
</script>
@endsection
@endsection
@include('modals.report_custom_filter_list_data')