<table class="email_pdf">
    <tbody>
        <tr>
            <td>
                <img class="header_image" src="<?php echo asset('/events/' . $tableData->event_header) ?>" />
            </td>
        </tr>
        <tr>
            <td style="text-align: center;">
                <h2><?php echo $tableData->title; ?></h2>
                <h2><?php echo date('d F', strtotime($tableData->start_date)) . ' - ' . date('d F Y', strtotime($tableData->end_date)); ?></h2>
                <h3>
                    <address>
                        <?php echo $tableData->venue_name; ?>
                        <?php echo $tableData->venue_address; ?>
                    </address>
                </h3>
                <h1>
                    <span style="text-transform: uppercase;">Onsite Post Visitor Event Report</span>
                </h1>
            </td>
        </tr>
    </tbody>
</table>
<span style="page-break-after: always;"></span>