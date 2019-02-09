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
                table.with_border tr th{
                    border: 1px solid black;
                    vertical-align: top;
                    text-align: center;
                }
                table.with_border tr td{
                    border: 1px solid black;
                    vertical-align: top;
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
        <?php echo $eventData; ?>
        <?php echo $desigData; ?>
        <?php echo $countryData; ?>
    </body>
</html>