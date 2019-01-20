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
                table.email_pdf{
                    width: 90%;
                    margin: 5%;
                    border: none;
                }
                table.email_pdf tr td{
                    border:none;
                    padding: 5%;
                }
            }
        </style>
    </head>

    <body>
        <table class="email_pdf" style="width: 100%">
            <tbody>
                <tr>
                    <td colspan="2">
                        <img src="<?php echo asset('/events/'.$event_data->event_header) ?>" />
                    </td>
                </tr>
                <tr>
                    <td colspan="2">CONFIRMATION OF REGISTRATION</td>
                </tr>
                <tr>
                    <td width="72%">
                        <div>
                            Dear <?php echo $event_data->first_name; ?>,
                            We are pleased to confirm your registration to <strong><?php echo $event_data->title; ?></strong>
                            Your registration information is as follows: <br>
                            <table>
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
                    <td colspan="2">Please bring along a copy of this confirmation slip and present it at the "Pre-Registered" counters on-site to collect your Guest Pass. As identity checks may be carried out at the security checkpoints, please bring along your passport, NRIC or driving license for verification.</td>
                </tr>
            </tbody>
        </table>

    </body>
</html>