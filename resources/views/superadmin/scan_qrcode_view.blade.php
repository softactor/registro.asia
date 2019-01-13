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
            <form id="custom_filter_report_form">
                {{ csrf_field() }}
                <div class="col-sm-11">
                    <div class="quick_report_container">
                        <div class="row">
                            <div class="col-md-3">
                                <?php
                                    $quickReporturl     =   $page_details['url'];                                    
                                ?>
                                <div class="form-group">
                                    <input type="text" id="user_serial_number" name="user_serial_number" autofocus/>
                                </div>
                                <button type="button" class="btn btn-sm" onclick="get_reg_data_by_slnumber('<?php echo $quickReporturl; ?>');">get data</button>
                            </div>
                            <div class="col-md-8">                        
                                <div id="quick_report_generate_area">
                                    
                                </div>
                            </div>
                        </div>
                    </div>
                </div><!--/tab-content-->
            </form>
        </div><!--/row-->        
    </div>
</section>
@section('footer_js_scrip_area')
@parent
<script type="text/javascript" src="{{ asset('js/printThis.js')}}"></script>
<script type="text/javascript" src="{{ asset('js/name_badge_prints.js')}}"></script>
<script type="text/javascript">
    function get_reg_data_by_slnumber(url){
        if($('#user_serial_number').val()){
            $.ajax({
                type: "GET",
                url: url,
                dataType: "JSON",
                data: 'serial_id=' + $('#user_serial_number').val(),
                success: function (response) {
                    $('#quick_report_generate_area').html(response.link);
                }// end of success
            }); // end of ajax call
        }
    }
</script>
@endsection
@endsection