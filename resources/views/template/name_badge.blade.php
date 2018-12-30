<form id="namebadgeprintcount">
    <table class="report-container">
        <thead class="report-header">
            <tr>
                <th class="report-header-cell">
                    <div class="header-info">
                        <span>Name badge Print</span>
                    </div>
                </th>
            </tr>
        </thead>
        <tfoot class="report-footer">
            <tr>
                <td class="report-footer-cell">
                    <div class="footer-info">
                        <!--<span>Footer Info</span>-->
                    </div>
                </td>
            </tr>
        </tfoot>
        <tbody class="report-content">
            <?php
            $configFound = false;
            foreach ($user_datas as $user_data) {
                $events = DB::table('events')->where('id', $user_data->event_id)->first();
                $whereData = [
                    'event_id' => $user_data->event_id,
                    'namebadgeTemplateType' => 'Default'
                ];
                $getConfigNameBadgePos = get_data_name_by_where('name_badge_position', $whereData);
                if (isset($getConfigNameBadgePos) && !empty($getConfigNameBadgePos)) {
                    if ($getConfigNameBadgePos->nameBadgeTemplateSet == "defaultEventNameBadge1") {
                        ?>
                        <tr>
                            <td class="report-content-cell">
                                <div class="main">

                                    <div class="nameBadgeTemplateHolder">
                                        <div class="defaultEventNameBadge defaultEventNameBadge1">
                                            <div class="defaultEventNameBadgeheader">
                                                <img class="nameBadgeHeader img-responsive" src="<?php echo asset('/events/' . $events->event_header); ?>"/>
                                            </div>
                                            <div class="userBasicInfo">
                                                <h3><?php echo $user_data->first_name . ' ' . $user_data->last_name; ?></h3>
                                                <h4><?php echo $user_data->designation; ?></h4>
                                                <h5><?php echo $user_data->company_name ?></h5>
                                                <h6><?php echo $user_data->local_state; ?></h6>
                                            </div>
                                            <div class="userQrCode">
                                                <img src="<?php echo asset('pdf/' . $user_data->qrcode_path) ?>" style="height: 35px; width: 254px;" />
                                            </div>
                                            <h6><?php echo $user_data->serial_digit; ?></h6>
                                            <div class="userType">
                                                <h2><?php echo $user_data->namebadge_user_label; ?></h2>
                                            </div>
                                        </div>
                                    </div>
                                    <input type="hidden" name="name_badge_print[]" value="<?php echo $user_data->id; ?>">

                                </div>
                            </td>
                        </tr>
                        <?php
                    } elseif ($getConfigNameBadgePos->nameBadgeTemplateSet == "defaultEventNameBadge2") {
                        
                    } elseif ($getConfigNameBadgePos->nameBadgeTemplateSet == "defaultEventNameBadge3") {
                        
                    }
                }
            }
            ?>
        </tbody>
    </table>
</form>