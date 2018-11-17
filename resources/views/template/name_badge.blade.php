<style type="text/css">
    .user-row {
    margin-bottom: 14px;
}

.user-row:last-child {
    margin-bottom: 0;
}

.dropdown-user {
    margin: 13px 0;
    padding: 5px;
    height: 100%;
}

.dropdown-user:hover {
    cursor: pointer;
}

.table-user-information > tbody > tr {
    border-top: 1px solid rgb(221, 221, 221);
}

.table-user-information > tbody > tr:first-child {
    border-top: 0;
}


.table-user-information > tbody > tr > td {
    border-top: 0;
}
.toppad
{margin-top:20px;
}
</style>
<?php
    foreach($user_datas as $user_data){
        $whereData  =   [
            'event_id'=>$user_data->event_id
        ];
        $getConfig  =   get_data_name_by_where('name_badge_config', $whereData); 
?>
<div
    style="width: <?php echo $getConfig->namebadge_width.$getConfig->measure_unit ?>;
    height: <?php echo $getConfig->namebadge_height.$getConfig->measure_unit ?>;
    background-repeat: no-repeat;
    background-image: url({{ asset('namebadge/'.$getConfig->image_path) }});
    ">
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
    
    ?>
</div>
<?php } ?>