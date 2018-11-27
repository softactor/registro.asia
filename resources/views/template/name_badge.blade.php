<?php
    $configFound    =   false;
    foreach($user_datas as $user_data){
        $whereData  =   [
            'event_id'=>$user_data->event_id
        ];
        $getConfig  =   get_data_name_by_where('name_badge_config', $whereData);
        if(isset($getConfig) && !empty($getConfig)){
            $configFound = true;
?>
        <style type="text/css">
            @media screen {
                .print_name_badge{
                    width: <?php echo $getConfig->namebadge_width . $getConfig->measure_unit ?>;
                    height: <?php echo $getConfig->namebadge_height . $getConfig->measure_unit ?>;
                    background-repeat: no-repeat;
                    background-image: url(<?php echo asset('namebadge/' . $getConfig->image_path) ?>)
                }
            }
            @media print {
                .print_name_badge{
                    width: <?php echo $getConfig->namebadge_width . $getConfig->measure_unit ?> !important;
                    height: <?php echo $getConfig->namebadge_height . $getConfig->measure_unit ?> !important;
                    background-repeat: no-repeat !important;
                    background-image: url(<?php echo asset('namebadge/' . $getConfig->image_path) ?>) !important;
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