<?php    
    $configFound    =   false;
    foreach($user_datas as $user_data){
        $whereData  =   [
            'event_id'=>$user_data->event_id
        ];
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
                            color: <?php echo ((isset($printLayout->font_color) && !empty($printLayout->font_color))? $printLayout->font_color : '#000000') ?>;
                        }                                
                    }
                    
        </style>
<div class="print_name_badge">
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
    <?php }} ?>
<?php
    if(!$configFound){
        echo '<h1>Please configure the template first.</h1>';
    }
?>