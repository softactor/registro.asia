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
                <div class="row">
                    <div class="col-md-12">
                        <button type="button" onclick="print_complete_report();">Print</button>
                        <div id="pdf_content">
                        <div id="pdf_content_sectio">
                            <?php if(isset($eventData) && !empty($eventData)) { echo $eventData; } ?>
                            <h3><span style="text-transform: capitalize;">Table of Content</span></h3>
                            <table class="table table-bordered email_pdf with_border complete_report" cellspacing="0" cellpadding="0">
                                        <thead>
                                            <tr>
                                                <th>SLNO.</th>
                                                <th>Content</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <tr>
                                                <td></td>
                                                <td>Overall breakdown by category</td>
                                            </tr>
                                            <tr>
                                                <td></td>
                                                <td>Attendees by country breakdown</td>
                                            </tr>
                                            <tr>
                                                <th colspan="2">Survey Questioneries</th>
                                            </tr>
                                            <?php
                                                $count          =   1;
                                                $totalVisitor   =   0;
                                                foreach($onsiteVisitorAnalysis['formQuestionLevelsArray'] as $data){
                                            ?>
                                            <tr>
                                                <td><?php echo $count; ?></td>
                                                <td><a href="#questio_link_<?php echo $count; ?>"><?php echo $data; ?></a></td>
                                            </tr>
                                            <?php $count++; } ?>
                                        </tbody>
                                    </table>
                            <?php if(isset($desigData) && !empty($desigData)) { ?> 
                            
                                <h3><span style="text-transform: capitalize;">Overall breakdown by category</span></h3>
                                <table class="table table-bordered email_pdf with_border complete_report" cellspacing="0" cellpadding="0">
                                    <thead>
                                        <tr>
                                            <th>SlNO</th>
                                            <th>Categories</th>
                                            <th>Count</th>
                                            <th>%</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <?php
                                            $count          =   1;
                                            $percentage   =   0;
                                            $total_count = array_sum(array_column($desigData->toArray(), 'desig_count'));
                                            foreach($desigData as $data){
                                                $percentage     =   $percentage + number_format((float)(($data->desig_count * 100) / $total_count), 2, '.', '');
                                        ?>
                                        <tr>
                                            <td><?php echo $count; ?></td>
                                            <td><?php echo $data->designation; ?></td>
                                            <td style="text-align: center;"><?php echo $data->desig_count; ?></td>
                                            <td style="text-align: center;"><?php echo number_format((float)(($data->desig_count * 100) / $total_count), 2, '.', ''); ?></td>
                                        </tr>
                                        <?php $count++; } ?>
                                        <tr>
                                            <td colspan="2">Total Visitorship</td>
                                            <td style="text-align: center;"><?php echo $total_count; ?></td>
                                            <td style="text-align: center;"><?php echo $percentage; ?></td>
                                        </tr>
                                    </tbody>
                                </table>
                                <span style="page-break-after: always;"></span>
                            <?php } ?>
                            <?php if(isset($countryData) && !empty($countryData)) { 
                            ?>
                               <h3><span style="text-transform: capitalize;">Attendees by country breakdown</span></h3>
                                    <table class="table table-bordered email_pdf with_border complete_report" cellspacing="0" cellpadding="0">
                                        <thead>
                                            <tr>
                                                <th>SLNO.</th>
                                                <th>Country</th>
                                                <th>Prereg</th>
                                                <th>Onsite</th>
                                                <th>Total</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <?php
                                                $count          =   1;
                                                $totalVisitor   =   0;
                                                foreach($countryData['countries_data'] as $data){
                                            ?>
                                            <tr>
                                                <td><?php echo $count; ?></td>
                                                <td><?php echo $data['country']; ?></td>
                                                <td style="text-align: center;"><?php echo $data['online']; ?></td>
                                                <td style="text-align: center;"><?php echo $data['onsite']; ?></td>
                                                <td style="text-align: center;"><?php echo $data['total']; ?></td>
                                            </tr>
                                            <?php $count++; } ?>
                                        </tbody>
                                    </table>
                                    <table class="table table-bordered email_pdf with_border complete_report" cellspacing="0" cellpadding="0">
                                        <thead>
                                            <tr>
                                                <th>SLNO.</th>
                                                <th>Onsite visitorship</th>
                                                <th>Count</th>
                                                <th>%</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <?php
                                                $count          =   1;
                                                $totalVisitor   =   0;
                                                foreach($countryData['countries_ratio'] as $data){
                                            ?>
                                            <tr>
                                                <td><?php echo $count; ?></td>
                                                <td><?php echo $data['title']; ?></td>
                                                <td style="text-align: center;"><?php echo $data['local_attende']; ?></td>
                                                <td style="text-align: center;"><?php echo $data['percentage']; ?></td>
                                            </tr>
                                            <?php $count++; } ?>
                                        </tbody>
                                    </table>
                                    <div class="chart_holder">
                                         <span id="country_attendee_ratio"></span>
                                    </div>
                                    <span style="page-break-after: always;"></span>
                                    @section('footer_js_scrip_area')
                                    @parent

                                    <script type="text/javascript">
                                        var chartParam = {
                                            selector_id         : "country_attendee_ratio",
                                            chart_title         : "Attendees by country breakdown",
                                            data                : <?php echo $countryData['countries_ratio_chart']; ?>,
                                        };
                                        yearly_events_report(chartParam);
                                    </script>
                                    @endsection 
                                
                            <?php } ?>
                            <?php if(isset($onsiteVisitorAnalysis) && !empty($onsiteVisitorAnalysis)) {
                                $questionCount  =   1;
                                $chartUrl   =   url('su/save_chart_image');
                                foreach($onsiteVisitorAnalysis['formQuestionTableArray'] as $data){
                            ?>
                                <h3 id="questio_link_<?php echo $questionCount; ?>"><span style="text-transform: capitalize;"><?php echo $questionCount.'. '.$data['question_name'] ?></span></h3>
                                <table class="table table-bordered email_pdf with_border complete_report" cellspacing="0" cellpadding="0">
                                    <thead>
                                        <tr>
                                            <th>SLNO.</th>
                                            <th></th>
                                            <th>Count</th>
                                            <th>%</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <?php
                                            $count          =   1;
                                            $totalVisitor   =   0;
                                            $percentage     =   0;
                                            foreach($data['question_answer_counting'] as $ans){
                                                $percentage     =   $percentage + number_format((float)(($ans['counting']->total * 100) / $data['totalCounting']), 2, '.', '');
                                        ?>
                                        <tr>
                                            <td><?php echo $count; ?></td>
                                            <td><?php echo $ans['optionValue']; ?></td>
                                            <td style="text-align: center;"><?php echo $ans['counting']->total; ?></td>
                                            <td style="text-align: center;"><?php echo number_format((float)(($ans['counting']->total * 100) / $data['totalCounting']), 2, '.', ''); ?></td>
                                        </tr>
                                        <?php $count++; } ?>
                                        <tr>
                                            <th colspan="2">Total</th>
                                            <th><?php echo $data['totalCounting']; ?></th>
                                            <th><?php echo $percentage; ?></th>
                                        </tr>
                                    </tbody>
                                </table>
                                <div class="chart_holder">
                                    <span id="questio_chart_<?php echo $questionCount; ?>"></span>
                                    <img id="mock" />
                               </div>
                               <span style="page-break-after: always;"></span>
                               @section('footer_js_scrip_area')
                               @parent

                               <script type="text/javascript">
                                   var chartParam = {
                                       selector_id         : "questio_chart_<?php echo $questionCount; ?>",
                                       chart_title         : "<?php echo $data['question_name']; ?>",
                                       xdata                : <?php echo $data['xdata']; ?>,
                                       ydata                : <?php echo $data['ydata']; ?>,
                                   };
                                   generate_bar_chart(chartParam);
                                   EXPORT_WIDTH = 1000;

                                    function save_chart(chart) {
                                        var render_width = EXPORT_WIDTH;
                                        var render_height = render_width * chart.chartHeight / chart.chartWidth

                                        // Get the cart's SVG code
                                        var svg = chart.getSVG({
                                            exporting: {
                                                sourceWidth: chart.chartWidth,
                                                sourceHeight: chart.chartHeight
                                            }
                                        });
                                        var imgSrc  =    'data:image/svg+xml;base64,' + window.btoa(svg);
                                        store_pdf_image_data('questio_chart_<?php echo $questionCount; ?>', '<?php echo $chartUrl; ?>', imgSrc);
                                    }
                                    save_chart($('#questio_chart_<?php echo $questionCount; ?>').highcharts());
                               </script>
                               @endsection
                               <?php                            
                                $questionCount++;
                            } ?>
                            <?php } ?>
                        </div>
                        </div>
                    </div>
                </div>
            </div><!--/tab-content-->
        </div><!--/row-->   
    </div>
</section>
@endsection