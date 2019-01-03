<!DOCTYPE html>
<html lang="en">

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
        <title>Receipt</title>
        <link href="{{ asset('bootstrap/css/bootstrap.min.css')}}" rel="stylesheet">
        <!-- Normalize or reset CSS with your favorite library -->
        <link rel="stylesheet" href="{{ asset('css/normalize.min.css') }}">
        <link rel="stylesheet" href="{{ asset('css/paper.css') }}">
        <!-- Custom styles for this document -->
        <link href='https://fonts.googleapis.com/css?family=Tangerine:700' rel='stylesheet' type='text/css'>
        <style>
            .page_break{
                page-break-after: always;
            }
            .defaultEventNameBadgeheaderContainer { 
                float: left;
                width: 75mm;
                height: 105mm;
                /*background-color: red;*/
                margin: 1.5mm 1.5mm 3.5mm 1.5mm;
            }
            .defaultEventNameBadgeheader{
                float: left;
            }
            .userBasicInfo{
                float: left;
                width: 98%;
                margin: 5% 1% 0 1%;
                height: 125px;
                text-align: center;
                background-color: white;
                
            }
            .userQrCode{
                float: left;
                width: 100%;
                height: 108px;
                margin-top: 15%;
                /*border: 1px solid blue;*/
            }
            .userQrCode img{
                text-align: center;
                margin: 3% 35% 0 35%;
            }
            .userType{
                float: left;
                width: 98%;
                margin: 30% 1% 0 1%;
                height: 75px;
                text-align: center;
                background: white;
            }
            .name_badge_serial_number{
                float: left;
                width: 90%;
                text-align: center;
                margin: 27% 5% 0 5%;  
            }
        </style>
    </head>

    <!-- Set "A5", "A4" or "A3" for class name -->
    <!-- Set also "landscape" if you need -->
    <body class="A4">
        <?php
        $count  =   0;
        $configFound = false;
        foreach ($user_datas as $user_data) {
            $namebadge_user_label_color =   "#FFFFFF";
            switch($user_data->namebadge_user_label){
                case 'Visitor':
                    $namebadge_user_label_color =   "#FFFF0A";
                    break;
                case 'Organiser':
                    $namebadge_user_label_color =   "#38ACEC";
                    break;
                case 'Exhibitor':
                    $namebadge_user_label_color =   "#54C571";
                    break;
                default:
                    $namebadge_user_label_color =   "#FFFFFF";
                    break;
            }
            $count++;
            $events = DB::table('events')->where('id', $user_data->event_id)->first();
            $whereData = [
                'event_id' => $user_data->event_id,
                'namebadgeTemplateType' => 'Default'
            ];
            $getConfigNameBadgePos = get_data_name_by_where('name_badge_position', $whereData);
            if (isset($getConfigNameBadgePos) && !empty($getConfigNameBadgePos)) {
                if ($getConfigNameBadgePos->nameBadgeTemplateSet == "defaultEventNameBadge1") {
                    ?>
                    <div class="defaultEventNameBadgeheaderContainer">
                        <div class="defaultEventNameBadgeheader">
                            <img class="img-responsive" src="<?php echo asset('/events/' . $events->event_header); ?>"/>
                        </div>
                        <div class="userBasicInfo" <?php if($count == 2){ ?> style="margin-top: 8%" <?php } ?>>
                            <h3><?php echo $user_data->first_name . ' ' . $user_data->last_name; ?></h3>
                            <h4><?php echo $user_data->designation; ?></h4>
                            <h5><?php echo $user_data->company_name ?></h5>
                            <h6><?php echo $user_data->local_state; ?></h6>
                        </div>
                        <div class="userQrCode" <?php if($count == 2){ ?> style="margin-top: 28%" <?php } ?>>
                            <img src="<?php echo asset('pdf/' . $user_data->qrcode_path) ?>" />
                        </div>
                        <h5 class="name_badge_serial_number" <?php if($count == 2){ ?> style="margin-top: 45%" <?php } ?>><?php echo $user_data->serial_digit; ?></h5>
                        <div class="userType" style="background-color: <?php echo $namebadge_user_label_color; ?>;  <?php if($count == 2){ ?>margin-top: 50% <?php } ?>">
                            <h2><?php echo $user_data->namebadge_user_label; ?></h2>
                        </div>
                    </div>
                    <div style="clear: both"></div>
                <?php
                    if($count   ==   2){
                        echo "<div class='page_break'></div>";
                        $count = 0;
                    }               
                }
            }
        } ?>
    </body>
</html>