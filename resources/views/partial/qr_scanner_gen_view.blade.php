<?php
    $bulkNameBadgePrint    =   url('su/bulkNameBadgePrint');
    $saveNameBadgeIdIntoSession    =   url('su/saveNameBadgeIdIntoSession');
?>
<div class="table-responsive">
    <table id="table_quick_report" class="table table_quick_report table-bordered">
        <thead>
            <tr>
                <th colspan="2">Registration Details</th>
            </tr>
        </thead>
        <tbody>                                                
            <tr>
                <td width="149">Name</td>
                <td width="331"><span id="reg_name"><?php echo $users_details->first_name. ' '.$users_details->last_name;  ?></span></td>
            </tr>
            <tr>
                <td>Email</td>
                <td><span id="reg_email"><?php echo $users_details->email;  ?></span></td>
            </tr>
            <tr>
                <td>Company Name</td>
                <td><span id="reg_company_name"><?php echo $users->company_name;  ?></span></td>
            </tr>
            <tr>
                <td>Country</td>
                <td><span id="reg_country_name"><?php echo $users_details->country_id;  ?></span></td>
            </tr>
            <tr>
                <td colspan="2">
                    <a target="_blank" type="button" class="btn btn-primary btn-sm pull-right" onclick="saveNameBadgeIdIntoSession('<?php echo $saveNameBadgeIdIntoSession; ?>', '<?php echo $users_details->id; ?>')" href="<?php echo $bulkNameBadgePrint; ?>">Print</a>
                </td>
            </tr>
        </tbody>
    </table>
</div>