<!doctype html>
<html>
    <head>
        <meta charset="utf-8">
        <title>Event Confirmation</title>
        <style>
            @media print { 
                body {
                    font-family: "Palatino Linotype", "Book Antiqua", Palatino, serif;
                    font-size: 1em;
                    color: #333333;
                    margin-top: 2cm;
                    margin-right: 2cm;
                    margin-bottom: 1.5cm;
                    margin-left: 2cm
                }
            }
            @media print {
                @page {
                    size: A4;
                    margin: 0;
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
                    width: 17cm;
                }
            }
        </style>
    </head>
    <body>
        <div class="pdf_container">
            <table class="email_pdf">
                <tbody>
                    <tr>
                        <td colspan="2">
                            <img class="header_image" src="<?php echo asset('/events/01-14-2019_event_template_header_1547441778.png') ?>" />
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2">CONFIRMATION OF REGISTRATION</td>
                    </tr>
                    <tr>
                        <td width="72%">
                            <div>
                                Dear Tanveer Qureshee,
                                <br>
                                We are pleased to confirm your registration to <strong>Bangladesh Banizzo Mela</strong>
                                Your registration information is as follows: <br>
                                <table class="email_pdf user_details_table">
                                    <tbody>
                                        <tr>
                                            <td>Salutation:</td>
                                            <td>Mr</td>
                                        </tr>
                                        <tr>
                                            <td>First name:</td>
                                            <td>Tanveer</td>
                                        </tr>
                                        <tr>
                                            <td>Last name</td>
                                            <td>Qureshee</td>
                                        </tr>
                                        <tr>
                                            <td>Gender</td>
                                            <td>Male</td>
                                        </tr>
                                        <tr>
                                            <td>Email</td>
                                            <td>tanveerqureshee1@gmail.com</td>
                                        </tr>
                                        <tr>
                                            <td>Phone Number</td>
                                            <td>012345678(Landline); 01716600843(Mobile)
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>Registration Type</td>
                                            <td>Online
                                            </td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                        </td>
                        <td width="28%"><img src="<?php echo asset('pdf/000520101278.png'); ?>" title="qrcode" width="75" height="75" /></td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            <p>
                            Please bring along a copy of this confirmation slip and present it at the "Pre-Registered" counters on-site to collect your Guest Pass. As identity checks may be carried out at the security checkpoints, please bring along your passport, NRIC or driving license for verification.
                            </p>
                        </td>
                    </tr>
                </tbody>
            </table>
        </div>
    </body>
</html>