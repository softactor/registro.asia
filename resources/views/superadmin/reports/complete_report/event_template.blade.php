<table class="one_page_section" cellspacing="0" cellpadding="0">
    <tr>
        <td>
            <table class="pdf_table" cellspacing="0" cellpadding="0">
                <tbody>
                    <tr>
                        <td style="border: none;">
                            <img class="print_header_image" src="<?php echo asset('/events/' . $tableData->event_header) ?>" />
                        </td>
                    </tr>
                    <tr>
                        <td style="text-align: center; border: none; background-color: white;">
                            <div class="pdf_first_page">
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
                            </div>
                        </td>
                    </tr>
                </tbody>
            </table>
        </td>
    </tr>
</table>
<div class="page-break"></div>