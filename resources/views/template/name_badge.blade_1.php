<style type="text/css">
                body {
                        width: 100%;
                        height: 100%;
                        margin: 0;
                        padding: 0;
                    }
                    * {
                        box-sizing: border-box;
                        -moz-box-sizing: border-box;
                    }
                    @media print {
                        @page Section1 {
                            size: 8.27in 11.69in; 
                            margin: .5in .5in .5in .5in; 
                            mso-header-margin: .5in; 
                            mso-footer-margin: .5in; 
                            mso-paper-source: 0;
                        }



                        div.Section1 {
                            page: Section1;
                        } 
                        .nameBadgeTemplateHolder {page-break-before:always;}
                        .nameBadgeTemplateHolder{
                                        top: -50px !important;
                                        position: relative !important;
                                        text-align: center !important;
                                        background: black !important;
                                        padding: 1% !important;
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
<?php    
    $configFound    =   false;
    foreach($user_datas as $user_data){
        $events = DB::table('events')->where('id', $user_data->event_id)->first();
        $whereData  =   [
            'event_id'              =>  $user_data->event_id,
            'namebadgeTemplateType' =>  'Default'
        ];
        $getConfigNameBadgePos  =   get_data_name_by_where('name_badge_position', $whereData);
        if(isset($getConfigNameBadgePos) && !empty($getConfigNameBadgePos)){
            if($getConfigNameBadgePos->nameBadgeTemplateSet ==  "defaultEventNameBadge1"){ ?>
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
            <?php }elseif($getConfigNameBadgePos->nameBadgeTemplateSet ==  "defaultEventNameBadge2"){
                
            }elseif($getConfigNameBadgePos->nameBadgeTemplateSet ==  "defaultEventNameBadge3"){
                
            }
        }else{
        
        $getConfig  =   get_data_name_by_where('name_badge_config', $whereData);
        if(isset($getConfig) && !empty($getConfig)){            
            $configFound = true;
            
            $layoutConfigwhereData  =   [
                'event_id'=>$user_data->event_id
            ];
            $getLayoutConfig  =   get_data_name_by_where('print_layout_config', $layoutConfigwhereData);
            if(isset($getLayoutConfig) && !empty($getLayoutConfig)){
                $printLayout    = json_decode($getLayoutConfig->print_config_values);                
            }else{
                $printLayout    =   [];
            }
            
?>
        <style type="text/css">
            @page {
                        size: A4;
                        margin: 0;
                    }
                body {
                        width: 100%;
                        height: 100%;
                        margin: 0;
                        padding: 0;
                    }
                    * {
                        box-sizing: border-box;
                        -moz-box-sizing: border-box;
                    }
                    @media screen {
                        .print_name_badge{
                            width: <?php echo $getConfig->namebadge_width . $getConfig->measure_unit ?>;
                            height: <?php echo $getConfig->namebadge_height . $getConfig->measure_unit ?>;
                            background-repeat: no-repeat;
                            background-image: url(<?php echo asset('namebadge/' . $getConfig->image_path) ?>)
                        }
                    }
                    @media print {
                        html, body {
                            width: <?php echo ((isset($printLayout->page_width) && !empty($printLayout->page_width))? $printLayout->page_width : '21cm') ?>;
                            height: <?php echo ((isset($printLayout->page_height) && !empty($printLayout->page_height))? $printLayout->page_height : '9.7cm') ?>;
                            margin-top: <?php echo ((isset($printLayout->margin_top) && !empty($printLayout->margin_top))? $printLayout->margin_top : '2cm') ?>;
                            margin-right: <?php echo ((isset($printLayout->margin_right) && !empty($printLayout->margin_right))? $printLayout->margin_right : '0cm') ?>;
                            margin-bottom: <?php echo ((isset($printLayout->margin_bottom) && !empty($printLayout->margin_bottom))? $printLayout->margin_bottom : '1.5cm') ?>;
                            margin-left: <?php echo ((isset($printLayout->margin_left) && !empty($printLayout->margin_left))? $printLayout->margin_left : '1.5cm') ?>
                        }
                        .print_name_badge{
                            width: <?php echo $getConfig->namebadge_width . $getConfig->measure_unit ?> !important;
                            height: <?php echo $getConfig->namebadge_height . $getConfig->measure_unit ?> !important;
                            background-repeat: no-repeat !important;
                            background-image: url(<?php echo asset('namebadge/' . $getConfig->image_path) ?>) !important;
                        }                                
                    }
                    
        </style>
<div class="print_name_badge">
    <input type="hidden" name="name_badge_print[]" value="<?php echo $user_data->id; ?>">
    <?php
    $salutation =   getNamebadgeFieldsPosition('salutation', $user_data->event_id, $user_data->salutation);
    if($salutation['status'] == 'success'){
        echo $salutation['data'];
    }
    
    $first_name =   getNamebadgeFieldsPosition('first_name', $user_data->event_id, $user_data->first_name);
    if($first_name['status'] == 'success'){
        echo $first_name['data'];
    }
    
    $last_name =   getNamebadgeFieldsPosition('last_name', $user_data->event_id, $user_data->last_name);
    if($last_name['status'] == 'success'){
        echo $last_name['data'];
    }
    
    $company_name =   getNamebadgeFieldsPosition('company_name', $user_data->event_id, $user_data->company_name);
    if($company_name['status'] == 'success'){
        echo $company_name['data'];
    }
    
    $gender =   getNamebadgeFieldsPosition('gender', $user_data->event_id, $user_data->gender);
    if($gender['status'] == 'success'){
        echo $gender['data'];
    }
    
    $mobile =   getNamebadgeFieldsPosition('mobile', $user_data->event_id, $user_data->mobile);
    if($mobile['status'] == 'success'){
        echo $mobile['data'];
    }
    
    $email =   getNamebadgeFieldsPosition('email', $user_data->event_id, $user_data->email);
    if($email['status'] == 'success'){
        echo $email['data'];
    }
    
    $serial_digit =   getNamebadgeFieldsPosition('serial_digit', $user_data->event_id, $user_data->serial_digit);
    if($serial_digit['status'] == 'success'){
        echo $serial_digit['data'];
    }
    
    $qrcode_path =   getNamebadgeFieldsPosition('qrcode_path', $user_data->event_id, $user_data->qrcode_path);
    if($qrcode_path['status'] == 'success'){
        echo $qrcode_path['data'];
    }
    
    $namebadge_user_label =   getNamebadgeFieldsPosition('namebadge_user_label', $user_data->event_id, $user_data->namebadge_user_label);
    if($namebadge_user_label['status'] == 'success'){
        echo $namebadge_user_label['data'];
    }
    
    ?>
</div>
    <?php }}} ?>
<?php
    if(!$configFound){
        echo '<h1>Please configure the template first.</h1>';
    }
    ?>
</form>