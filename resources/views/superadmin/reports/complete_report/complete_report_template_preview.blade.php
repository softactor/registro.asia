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
                            <style type="text/css">
                                #pdf_content_section{
                                    width: 21cm;
                                    height: auto;
                                    font-family: "Palatino Linotype", "Book Antiqua", Palatino, serif;
                                    font-size: 1em;
                                    color: #333333; 
                                }
                                #pdf_content_section table{
                                    border-collapse: collapse;
                                    width: 17cm;
                                    margin-top:.5cm;
                                    margin-right: 2cm;
                                    margin-bottom: 1.5cm;
                                    margin-left: 2cm;
                                }
                                #pdf_content_section table th, td {
                                    border: 1px solid #ddd;
                                    text-align: left;
                                    padding: 2px;
                                    vertical-align: top;
                                  }
                                  tr:nth-child(even) {background-color: #f2f2f2;
                                }
                                #pdf_content_section h3{
                                    text-align: center;
                                    text-transform: uppercase;
                                }
                                #pdf_content_section img.print_header_image {
                                    max-width: 100% !important;
                                 }
                                #pdf_content_section h2, h3 {
                                    margin-top:1.5cm;
                                    page-break-after: avoid;
                                 }
                                 #pdf_content_section ul, img {
                                    page-break-inside: avoid;
                                 }
                            </style>
                            <div id="pdf_content_section">
                                <?php if (isset($eventData) && !empty($eventData)) {
                                    echo $eventData;
                                } ?>
                                <h3>Table of Content</h3>
                                <table cellspacing="0" cellpadding="0">
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
                                        $count = 1;
                                        $totalVisitor = 0;
                                        foreach ($onsiteVisitorAnalysis['formQuestionLevelsArray'] as $data) {
                                            ?>
                                            <tr>
                                                <td><?php echo $count; ?></td>
                                                <td><a href="#questio_link_<?php echo $count; ?>"><?php echo $data; ?></a></td>
                                            </tr>
                                    <?php $count++;
                                } ?>
                                    </tbody>
                                </table>
<?php if (isset($desigData) && !empty($desigData)) { ?> 

                                    <h3>Overall breakdown by category</h3>
                                    <table cellspacing="0" cellpadding="0">
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
                                            $count = 1;
                                            $percentage = 0;
                                            $total_count = array_sum(array_column($desigData->toArray(), 'desig_count'));
                                            foreach ($desigData as $data) {
                                                $percentage = $percentage + number_format((float) (($data->desig_count * 100) / $total_count), 2, '.', '');
                                                ?>
                                                <tr>
                                                    <td><?php echo $count; ?></td>
                                                    <td><?php echo $data->designation; ?></td>
                                                    <td style="text-align: center;"><?php echo $data->desig_count; ?></td>
                                                    <td style="text-align: center;"><?php echo number_format((float) (($data->desig_count * 100) / $total_count), 2, '.', ''); ?></td>
                                                </tr>
        <?php $count++;
    } ?>
                                            <tr>
                                                <td colspan="2">Total Visitorship</td>
                                                <td style="text-align: center;"><?php echo $total_count; ?></td>
                                                <td style="text-align: center;"><?php echo $percentage; ?></td>
                                            </tr>
                                        </tbody>
                                    </table>
                                    <span style="page-break-after: always;"></span>
<?php } ?>
<?php if (isset($countryData) && !empty($countryData)) {
    ?>
                                    <h3>Attendees by country breakdown</h3>
                                    <table cellspacing="0" cellpadding="0">
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
                                            $count = 1;
                                            $totalVisitor = 0;
                                            foreach ($countryData['countries_data'] as $data) {
                                                ?>
                                                <tr>
                                                    <td><?php echo $count; ?></td>
                                                    <td><?php echo $data['country']; ?></td>
                                                    <td style="text-align: center;"><?php echo $data['online']; ?></td>
                                                    <td style="text-align: center;"><?php echo $data['onsite']; ?></td>
                                                    <td style="text-align: center;"><?php echo $data['total']; ?></td>
                                                </tr>
        <?php $count++;
    } ?>
                                        </tbody>
                                    </table>
                                    <table cellspacing="0" cellpadding="0">
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
    $count = 1;
    $totalVisitor = 0;
    foreach ($countryData['countries_ratio'] as $data) {
        ?>
                                                <tr>
                                                    <td><?php echo $count; ?></td>
                                                    <td><?php echo $data['title']; ?></td>
                                                    <td style="text-align: center;"><?php echo $data['local_attende']; ?></td>
                                                    <td style="text-align: center;"><?php echo $data['percentage']; ?></td>
                                                </tr>
        <?php $count++;
    } ?>
                                        </tbody>
                                    </table>
                                    <div style="text-align: center;">
                                        <div style="margin: 0 100px" id="country_attendee_ratio"></div>
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
<?php
if (isset($onsiteVisitorAnalysis) && !empty($onsiteVisitorAnalysis)) {
    $questionCount = 1;
    $chartUrl = url('su/save_chart_image');
    foreach ($onsiteVisitorAnalysis['formQuestionTableArray'] as $data) {
        ?>
                                        <h3 id="questio_link_<?php echo $questionCount; ?>"><?php echo $questionCount . '. ' . $data['question_name'] ?></h3>
                                        <table cellspacing="0" cellpadding="0">
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
        $count = 1;
        $totalVisitor = 0;
        $percentage = 0;
        foreach ($data['question_answer_counting'] as $ans) {
            $percentage = $percentage + number_format((float) (($ans['counting']->total * 100) / $data['totalCounting']), 2, '.', '');
            ?>
                                                    <tr>
                                                        <td><?php echo $count; ?></td>
                                                        <td><?php echo $ans['optionValue']; ?></td>
                                                        <td style="text-align: center;"><?php echo $ans['counting']->total; ?></td>
                                                        <td style="text-align: center;"><?php echo number_format((float) (($ans['counting']->total * 100) / $data['totalCounting']), 2, '.', ''); ?></td>
                                                    </tr>
            <?php $count++;
        } ?>
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
                                        </script>
                                        @endsection
        <?php
        $questionCount++;
    }
    ?>
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