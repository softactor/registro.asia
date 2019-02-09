<h2><span style="text-transform: capitalize;">Overall breakdown by category</span></h2>
<table class="email_pdf with_border" cellspacing="0" cellpadding="0">
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
            $totalVisitor   =   0;
            foreach($tableData as $data){
                $totalVisitor = $totalVisitor + $data->desig_count;
        ?>
        <tr>
            <td><?php echo $count; ?></td>
            <td><?php echo $data->designation; ?></td>
            <td style="text-align: center;"><?php echo $data->desig_count; ?></td>
            <td style="text-align: center;">%</td>
        </tr>
        <?php $count++; } ?>
        <tr>
            <td colspan="2">Total Visitorship</td>
            <td style="text-align: center;"><?php echo $totalVisitor; ?></td>
            <td style="text-align: center;">%</td>
        </tr>
    </tbody>
</table>
<span style="page-break-after: always;"></span>