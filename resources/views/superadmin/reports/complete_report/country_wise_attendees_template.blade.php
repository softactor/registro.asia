<h2><span style="text-transform: capitalize;">Attendees by country breakdown</span></h2>
<table class="email_pdf with_border" cellspacing="0" cellpadding="0">
    <thead>
        <tr>
            <th>SlNO</th>
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
            foreach($feedbackData['countries_data'] as $data){
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
<table class="email_pdf with_border" cellspacing="0" cellpadding="0">
    <thead>
        <tr>
            <th>SlNO</th>
            <th>Onsite visitorship</th>
            <th>Count</th>
            <th>%</th>
        </tr>
    </thead>
    <tbody>
        <?php
            $count          =   1;
            $totalVisitor   =   0;
            foreach($feedbackData['countries_ratio'] as $data){
        ?>
        <tr>
            <td><?php echo $count; ?></td>
            <td><?php echo $data['title']; ?></td>
            <td style="text-align: center;"><?php echo $data['local_attende']; ?></td>
            <td style="text-align: center;">%</td>
        </tr>
        <?php $count++; } ?>
    </tbody>
</table>
<span id="country_attendee_ratio"></span>
<span style="page-break-after: always;"></span>
@section('footer_js_scrip_area')
@parent

<script type="text/javascript">
    var chartParam = {
        selector_id         : "country_attendee_ratio",
        chart_title         : "Attendees by country breakdown",
        data                : <?php echo $feedbackData['countries_ratio_chart']; ?>,
    };
    yearly_events_report(chartParam);
</script>
@endsection