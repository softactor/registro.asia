<!--Extends parent app template-->
@extends('layout.app')
<!--Content insert section-->
@section('content')
<section class="container">
    <div class="container-page">
        <div class="row">
            <form id="custom_filter_report_form" action="#">
                <div class="col-sm-12">
                    <span id="generate_table"></span>
                </div><!--/tab-content-->
            </form>
        </div><!--/row-->
    </div>
</section>
@section('footer_js_scrip_area')
@parent
<script type="text/javascript" src="{{ asset('js/dashboard_report.js')}}"></script>
<script type="text/javascript">
    $.ajax({
        type: 'GET',
        url: "/su/get_custom_filter_report",
        dataType: 'json',
        data: 'generate_type=chart' + '&event_id=<?php echo $event_id; ?>',
        success: function (response) {
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
    function run_yearly_events_report(){
        var required_param = {
            dataType    : "yearly_events",
            event_id    : <?php echo $event_id; ?>,
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
            event_id     : <?php echo $event_id; ?>,
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
</script>
@endsection
@endsection