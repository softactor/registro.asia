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
<span style="page-break-after: always;"></span>