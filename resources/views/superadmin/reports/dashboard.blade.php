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
                <?php
                $firstMonth =   'January '.date('Y');
                $lastMonth  =   'December '.date('Y');
                $fts = strtotime($firstMonth);
                $lts = strtotime($lastMonth);
                ?>
                <h2>
                    {{ $page_details['page_title'] }}
                </h2>
                <form class="form-inline" action="/action_page.php">
                    <div class="form-group">
                        <input type="text" class="input-group form-control" id="start_date" placeholder="Enter start date" name="start_date" autocomplete="off" value="{{ date('01-m-Y', $fts) }}">
                    </div>
                    <div class="form-group">
                        <input type="text" class="input-group form-control" id="end_date" placeholder="Enter End date" name="end_date" autocomplete="off" value="{{ date('t-m-Y', $lts) }}">
                    </div>
                    <button type="submit" class="btn btn-default">Submit</button>
                </form>
                <div class="row">
                    <div class="col-md-6">
                        <div id="yearly_events" style="min-width: 310px; height: 400px; max-width: 600px; margin: 0 auto"></div>
                    </div>
                    <div class="col-md-6">
                        <div id="container" style="min-width: 310px; height: 400px; max-width: 600px; margin: 0 auto"></div>
                    </div>
                </div>
            </div><!--/tab-content-->

        </div><!--/col-9-->        
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
    //yearly_events
    var required_param = {
        dataType    : "yearly_events",
        startDate   : $('#start_date').val(),
        endDate     : $('#end_date').val(),
    };
    $.ajax({
        type: "GET",
        url: "/get_events_chart_data",
        dataType: "JSON",
        data: 'param=' + JSON.stringify(required_param),
        success: function (response) {
            console.log('json');
            console.log(response.result);
            var chartParam = {
                selector_id         : "yearly_events",
                chart_title         : "Total<br>Events<br>2018",
                data                : response.result,
            };
            yearly_events_report(chartParam);
        }// end of success
    }); // end of ajax call
</script>
@endsection
@endsection