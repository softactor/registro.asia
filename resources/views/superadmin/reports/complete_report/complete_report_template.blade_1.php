<!doctype html>
<html>
    <head>
        <meta charset="utf-8">
        <title>Complete Report</title>
        <script src="http://code.highcharts.com/highcharts.js"></script>
        <script src="http://code.highcharts.com/modules/exporting.js"></script>
        <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
        <style>
            @media screen {
                @page {
                    width: 210mm;
                    height: 297mm;
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
        <?php echo $onsiteVisitorAnalysis; ?>
        
        <img id="chart" style="width: 600px;" />
    </body>
    <script type="text/javascript">
        // Regular chart options
// Just never rendered with "new Highcharts.Chart" or "$('#container').highcharts()"
var options = {
    title: {
        text: 'Monthly Average Temperature',
        x: -20 //center
    },
    subtitle: {
        text: 'Source: WorldClimate.com',
        x: -20
    },
    xAxis: {
        categories: ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun',
                     'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec']
    },
    yAxis: {
        title: {
            text: 'Temperature (°C)'
        },
        plotLines: [{
            value: 0,
            width: 1,
            color: '#808080'
        }]
    },
    tooltip: {
        valueSuffix: '°C'
    },
    legend: {
        layout: 'vertical',
        align: 'right',
        verticalAlign: 'middle',
        borderWidth: 0
    },
    series: [{
        name: 'Tokyo',
        data: [7.0, 6.9, 9.5, 14.5, 18.2, 21.5, 25.2, 26.5, 23.3, 18.3, 13.9, 9.6]
    }, {
        name: 'New York',
        data: [-0.2, 0.8, 5.7, 11.3, 17.0, 22.0, 24.8, 24.1, 20.1, 14.1, 8.6, 2.5]
    }, {
        name: 'Berlin',
        data: [-0.9, 0.6, 3.5, 8.4, 13.5, 17.0, 18.6, 17.9, 14.3, 9.0, 3.9, 1.0]
    }, {
        name: 'London',
        data: [3.9, 4.2, 5.7, 8.5, 11.9, 15.2, 17.0, 16.6, 14.2, 10.3, 6.6, 4.8]
    }]
};


// URL to Highcharts export server
var exportUrl = 'http://export.highcharts.com/';

// POST parameter for Highcharts export server
var object = {
    options: JSON.stringify(options),
    type: 'image/png',
    async: true
};

// Ajax request
$.ajax({
    type: 'post',
    url: exportUrl,
    data: object,
    success: function (data) {
        // Update "src" attribute with received image URL
        $('#chart').attr('src', exportUrl + data);
    }
});
    </script>
</html>