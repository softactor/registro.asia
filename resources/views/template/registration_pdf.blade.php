<!doctype html>
<html>
    <head>
        <meta charset="utf-8">
        <title>Event Confirmation</title>
        <style>
            @media screen {
                @page {
                    size: A4;
                    margin: 0;
                }
                body {
                    font-family: "Palatino Linotype", "Book Antiqua", Palatino, serif;
                    font-size: 1em;
                    color: #333333;
                    margin-top: 2cm;
                    margin-right: 2cm;
                    margin-bottom: 1.5cm;
                    margin-left: 2cm
                }
                table.email_pdf{
                    width: 100%;
                    margin: 1%;
                }
                table.email_pdf tr td{
                    border:none;
                    padding: 1%;
                }
                
                table.user_details_table tr td{
                    font-weight: bold;
                }
                p{
                   word-wrap: break-word;
                }
                img.header_image{
                    width: 15cm;
                }
            }
        </style>
    </head>

    <body>
        <table class="email_pdf">
            <tbody>
                <tr>
                    <td colspan="2">
                        <img class="header_image" src="<?php echo asset('/events/'.$event_data->event_header) ?>" />
                    </td>
                </tr>
                <tr>
                    <td colspan="2">CONFIRMATION OF REGISTRATION</td>
                </tr>
                <tr>
                    <td width="72%">
                        <div>
                            <?php
                            $vars = array(
                                '{$first_name}'     => $user_data['first_name'],
                                '{$last_name}'      => $user_data['last_name'],
                                '{$event_title}'    => $event_data->title
                            );
                            $whereParam = [
                                'name'          => $event_data->id, //$request->event_id,
                                'post_type'     => 'pdf_text',
                            ];
                            $query = DB::table('settings')->select('values')->where($whereParam)->first();
                            if (isset($query) && !empty($query)) {
                                $string = $query->values;
                                echo strtr($string, $vars);
                                ;
                            }
                            ?>
                            Your registration information is as follows: <br>
                            <table class="email_pdf user_details_table">
                                <tbody>
                                    <tr>
                                        <td>Salutation:</td>
                                        <td>{{ $user_data['salutation'] }}</td>
                                    </tr>
                                    <tr>
                                        <td>First name:</td>
                                        <td>{{ $user_data['first_name'] }}</td>
                                    </tr>
                                    <tr>
                                        <td>Last name</td>
                                        <td>{{ $user_data['last_name'] }}</td>
                                    </tr>
                                    <tr>
                                        <td>Gender</td>
                                        <td>{{ $user_data['gender'] }}</td>
                                    </tr>
                                    <tr>
                                        <td>Email</td>
                                        <td>{{ $user_data['email'] }}</td>
                                    </tr>
                                    <tr>
                                        <td>Phone Number</td>
                                        <td>{{ $user_data['tel'] }}(Landline)<br><br>{{ $user_data['mobile'] }}(Mobile)
                                        </td>

                                    </tr>
                                    <tr>
                                        <td>Registration Type</td>
                                        <td>{{ $user_data['namebadge_user_label'] }}
                                        </td>

                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </td>
                    <td width="28%"><img src="<?php echo $qrcode; ?>" /></td>
                </tr>
                <tr>
                    <td colspan="2">
                        <p>
                        Please bring along a copy of this confirmation slip and present it at the "Pre-Registered" counters on-site to collect your Guest Pass.
                        As identity checks may be carried out at the security checkpoints, please bring along your passport, NRIC or driving license for verification.
                        </p>
                    </td>
                </tr>
            </tbody>
        </table>

    </body>
</html>