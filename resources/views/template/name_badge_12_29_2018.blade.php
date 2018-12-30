<style type="text/css">    
    @media print {
        #header { 
            position: fixed; 
            width: 100%; 
            top: 0; 
            left: 0; 
            right: 0;
        }
        #footer { 
            position: fixed; 
            width: 100%; 
            bottom: 0; 
            left: 0;
            right: 0;
        }
        @page Section1 {
            size: 8.27in 11.69in; 
            mso-header-margin: 2.5in; 
            mso-footer-margin: 2.5in; 
            mso-paper-source: 0;
        }
        body {
            margin-top: 5mm !important;
            margin-bottom: 5mm !important;
        }
        div.Section1 {
            page: Section1;
            clear: all !important;
            page-break-before:always !important;
            
        } 
        .nameBadgeTemplateHolder{
            position: relative !important;
            text-align: center !important;
            background: lightgrey !important;
            padding: 15px !important;
            display: block !important;
            page-break-inside: avoid !important;
        }
        .defaultEventNameBadge{
            position: relative !important;
            background: yellow !important;
            margin: 0 auto !important;
        }
        .defaultEventNameBadge1{
            width: 75mm !important;
            height: 105mm !important;
        }
        .defaultEventNameBadge2{
            width: 90mm !important;
            height: 135mm !important;
        }
        .defaultEventNameBadge3{
            width: 105mm !important;
            height: 75mm !important;
        }
        .nameBadgeTemplateHolder .defaultEventNameBadgeheader{
            float: left !important;
            margin-top: 10% !important
        }
        .nameBadgeTemplateHolder .userBasicInfo{
            width: 98% !important;
            float: left !important;
            height: auto !important;
            margin: 6% 1% 1% 1% !important;
            background: white !important;
        }
        .nameBadgeTemplateHolder .template3{
            width: 98% !important;
            float: left !important;
            height: 90px !important;
            margin: 2% 1% 1% 1% !important;
            background: white !important;
        }
        .nameBadgeTemplateHolder .userQrCode{
            float: left !important;
            margin: 5% 5% 0 !important;
            width: 90% !important;
            height: 35px !important;
            background: black !important;
        }
        .nameBadgeTemplateHolder .userType{
            width: 98% !important;
            height: 75px !important;
            float: left !important;
            margin: 2% 1% 1% 1% !important;
            background: white !important;
        }
        .nameBadgeTemplateHolder .userBasicInfoType2{
            margin-top: 16% !important;
        }
        .nameBadgeTemplateHolder .userBasicInfoType3{
            margin-top: 1% !important;
            height: 25px !important;
        }
        .nameBadgeTemplateHolder .userQrCodeType2{
            margin-top: 24% !important;
        }
        .nameBadgeTemplateHolder .userTypeType3{
            margin-top: 1% !important;
            height: 40px !important;
        }
        .userTypeType3 h2{
            margin-top: 0% !important;
        }
    }

</style> 
<form id="namebadgeprintcount">
    <div id="header"> 
    <h2>Name Badge Print</h2> 
  </div>  <!-- Custom HTML footer --> 
  <div id="footer"> 
    <h2>Name Badge Print</h2> 
  </div> 
<?php    
    $configFound    =   false;
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
                <div id='Section1'>      
                    <div class="nameBadgeTemplateHolder">
                        <div class="defaultEventNameBadge defaultEventNameBadge1">
                            <div class="defaultEventNameBadgeheader">
                                <img class="nameBadgeHeader img-responsive" src="<?php echo asset('/events/' . $events->event_header); ?>"/>
                            </div>
                            <div class="userBasicInfo">
                                <h3><?php echo $user_data->first_name . ' ' . $user_data->last_name; ?></h3>
                                <h4><?php echo $user_data->designation; ?></h4>
                                <h5><?php echo $user_data->company_name ?></h5>
                                <h6><?php echo $user_data->company_address; ?></h6>
                            </div>
                            <div class="userQrCode">
                                <img src="<?php echo asset('pdf/' . $user_data->qrcode_path) ?>" />
                            </div>
                            <div class="userType">
                                <h2><?php echo $user_data->namebadge_user_label; ?></h2>
                            </div>
                        </div>
                    </div>
                    <input type="hidden" name="name_badge_print[]" value="<?php echo $user_data->id; ?>">
                </div>
        <?php
        } elseif ($getConfigNameBadgePos->nameBadgeTemplateSet == "defaultEventNameBadge2") {
            
        } elseif ($getConfigNameBadgePos->nameBadgeTemplateSet == "defaultEventNameBadge3") {
            
        }
    }
}
?>
</form>