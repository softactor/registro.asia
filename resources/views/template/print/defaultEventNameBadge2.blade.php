<!DOCTYPE html>
<html lang="en">

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
        <title>Format-02</title>
        <link href="{{ asset('bootstrap/css/bootstrap.min.css')}}" rel="stylesheet">
        <!-- Normalize or reset CSS with your favorite library -->
        <link rel="stylesheet" href="{{ asset('css/normalize.min.css') }}">
        <link rel="stylesheet" href="{{ asset('css/paper.css') }}">
        <!-- Custom styles for this document -->
        <link href='https://fonts.googleapis.com/css?family=Tangerine:700' rel='stylesheet' type='text/css'>
        <style>
            @media screen {
                /* Default left, right, top, bottom margin is 2cm */
                @page {
                    size: 98mm 143mm;
                }
                .page_break{
                    page-break-after: always;
                }
                .page_break:last-child {
                    page-break-after: avoid;
                }
                html,body{
                    height:99%;
                    width: 100%;
                    margin: 0 !important; 
                    padding: 0 !important;
                    overflow: hidden;
                }
                .div_clear{
                    clear: both;
                }
                .print_area_container{
                    width: 98mm;
                    height: 143mm;
                    float: left;
                    left: 0;
                }
                .defaultEventNameBadgeheaderContainer{
                    float: left;
                    width: 90mm;
                    height: 135mm;
                    margin: 4mm;
                    /*background-color: yellow !important;*/
                }
                .defaultEventNameBadgeheaderContainer table{
                    width: 90mm;
                    height: 135mm;
                    border: 1px solid lightgray;
                }
                .defaultEventNameBadgeheaderContainer table tr td{
                    vertical-align: top;
                    text-align: center;
                }
                .defaultEventNameBadgeheader img{
                    float: left;
                    width: 90mm;
                    display: inline-block;
                }
                .userBasicInfo{
                    float: left;
                    width: 98%;
                    height: 27mm;
                    text-align: center;
                    background-color: white;

                }
                .userQrCode{
                    float: left;
                    width: 100%;
                    height: 15mm;
                    /*border: 1px solid blue;*/
                }
                .userQrCode img{
                    text-align: center;
                }
                .userType{
                    float: left;
                    width: 96%;
                    height: 20mm;
                    text-align: center;
                    margin: 2%;
                }
                .name_badge_serial_number{
                    float: left;
                    width: 100%;
                    height: 10mm;
                    margin: 2%;
                    text-align: center;
                }
            }
        </style>
    </head>

    <!-- Set "A5", "A4" or "A3" for class name -->
    <!-- Set also "landscape" if you need -->
    <body>        
        <?php
        $count = 0;
        $configFound = false;
        foreach ($user_datas as $user_data) {
            $labelTextColor     =   '#000000';
            $labelBgColor       =   '#FFFFFF';
            $getTextAndBGColor  =   get_nameBadgeBgAndTextColor($user_data->namebadge_user_label);
            if(isset($getTextAndBGColor) && !empty($getTextAndBGColor)){
                $labelBgColor           =   (isset($getTextAndBGColor->background_color) && !empty($getTextAndBGColor->background_color) ? $getTextAndBGColor->background_color: $labelBgColor);
                $labelTextColor         =   (isset($getTextAndBGColor->text_clor) && !empty($getTextAndBGColor->text_clor) ? $getTextAndBGColor->text_clor: $labelTextColor);
            }
            $count++;
            ?>
            <div class="print_area_container">
                <div class="defaultEventNameBadgeheaderContainer">
                    <table>
                        <tr>
                            <td style="width: 90mm; height: 27mm;">
                                <div class="defaultEventNameBadgeheader">
                                    <img src="<?php echo asset('/events/' . $events->event_header); ?>"/>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 90mm; height: 27mm;">
                                <div class="userBasicInfo">
                                    <h3><?php echo $user_data->first_name . ' ' . $user_data->last_name; ?></h3>
                                    <h4><?php echo $user_data->designation; ?></h4>
                                    <h5><?php echo $user_data->company_name ?></h5>
                                    <h6><?php echo $user_data->local_state; ?></h6>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 90mm; height: 27mm;">
                                <div class="userQrCode">
                                    <img src="<?php echo asset('pdf/' . $user_data->qrcode_path) ?>" />
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 90mm; height: 27mm;">
                                <h5 class="name_badge_serial_number"><?php echo $user_data->serial_digit; ?></h5>
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 90mm; height: 27mm; vertical-align: bottom;">
                                <div class="userType" style="background-color: <?php echo $labelBgColor; ?>; color: <?php echo $labelTextColor; ?>">
                                    <h2><?php echo $user_data->namebadge_user_label; ?></h2>
                                </div>
                            </td>
                        </tr>
                    </table>
                </div>                                
                <div class="div_clear"></div>
            </div>
            <div class="page_break"></div>
            <?php
        }
        ?>       
    </body>
</html>