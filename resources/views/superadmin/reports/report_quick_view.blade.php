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
                                    $quickReporturl     =   $page_details['quickReporturl'];
                                ?>
                                <div class="form-group">
                                    <select class="form-control" id="event_id" name="event_id" onchange="getQuickReportData('<?php echo $quickReporturl; ?>', this.value);">
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
                            <div class="col-md-8">                        
                                <div id="quick_report_generate_area"></div>
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
<script type="text/javascript">
    function getQuickReportData(url, event_id){
        if(event_id){
            $.ajax({
                type: "GET",
                url: url,
                dataType: "JSON",
                data: 'event_id=' + event_id,
                success: function (response) {
                    $('#quick_report_generate_area').html(response.data);
                }// end of success
            }); // end of ajax call
        }
    }
</script>
@endsection
@endsection