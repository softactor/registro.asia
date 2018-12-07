/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

function yearly_events_report(params) {
    Highcharts.chart(params.selector_id, {
        chart: {
            plotBackgroundColor: null,
            plotBorderWidth: 0,
            plotShadow: false
        },
        title: {
            text: params.chart_title,
            align: 'center',
            verticalAlign: 'middle',
            y: 40
        },
        tooltip: {
            pointFormat: '{series.name}: <b>{point.percentage:.1f}%</b>'
        },
        plotOptions: {
            pie: {
                dataLabels: {
                    enabled: true,
                    distance: -50,
                    style: {
                        fontWeight: 'bold',
                        color: 'white'
                    }
                },
                startAngle: -90,
                endAngle: 90,
                center: ['50%', '75%'],
                size: '110%'
            }
        },
        series: [{
                type: 'pie',
                name: 'Total attendee',
                innerSize: '50%',
                data: params.data
            }]
    });
}
function yearly_events_registration_type_report(params) {
    
// Build the chart
Highcharts.chart(params.selector_id, {
    chart: {
        plotBackgroundColor: null,
        plotBorderWidth: null,
        plotShadow: false,
        type: 'pie'
    },
    title: {
        text: params.chart_title
    },
    tooltip: {
        pointFormat: '{series.name}: <b>{point.y}</b>'
    },
    plotOptions: {
        pie: {
            allowPointSelect: true,
            cursor: 'pointer',
            dataLabels: {
                enabled: false
            },
            showInLegend: true
        }
    },
    series: [{
        name: 'Registration',
        colorByPoint: true,
        data: params.data
    }]
});
} 

function events_dynamic_form_report(param) {
    Highcharts.chart(param.selector_id, {
            tooltip: {
                formatter: function () {
                    return this.x +
                            ' ' + this.y + '%';
                }
            },
            chart: {
                type: 'bar',
                style: {
                    fontFamily: 'LatoWeb'
                }
            },

            legend: {
                enabled: false
            },
            title: {
                text: param.name,
            },
            subtitle: {
                text: '',
            },
            yAxis: {
                min: 0,
                title: {
                    text: '',
                }
            },
            xAxis: {
                categories: param.xdata
            },

            series: [{

                    name: '',
                    data: param.ydata,
                    color: ((param.colorCode) ? param.colorCode : "#29286c")
                }],
            navigation: {
                buttonOptions: {
                    align: 'right'
                }
            }
        });
}
