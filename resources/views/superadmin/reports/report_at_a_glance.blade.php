<?php
    $param  =   [
        'report_type'   =>  'all'
    ];
    $reportDataResponse     =   get_quick_report($param);
    if($reportDataResponse['status']    ==  'success'){
        $event          =    $reportDataResponse['data']['event'];
        $registeration  =    $reportDataResponse['data']['registeration'];
        $online         =    $reportDataResponse['data']['online'];
        $onsite         =    $reportDataResponse['data']['onsite'];
        $import         =    $reportDataResponse['data']['import'];
    }else{
        $event          =    $reportDataResponse['data']['event'];
        $registeration  =    $reportDataResponse['data']['registeration'];
        $online         =    $reportDataResponse['data']['online'];
        $onsite         =    $reportDataResponse['data']['onsite'];
        $import         =    $reportDataResponse['data']['import'];
    }
?>
<!-- Add the bg color to the header using any of the bg-* classes -->
<div class="widget-user-header bg-yellow">
    <h3 class="widget-user-username">At a glance</h3>
</div>
<div class="box-footer no-padding">
    <ul class="nav nav-stacked">
        <li><a href="#">Total Events <span class="pull-right badge bg-blue">{{$event}}</span></a></li>
        <li><a href="#">Total Registration <span class="pull-right badge bg-aqua">{{$registeration}}</span></a></li>
        <li><a href="#">Online Registration <span class="pull-right badge bg-green">{{$online}}</span></a></li>
        <li><a href="#">Onsite Registration <span class="pull-right badge bg-red">{{$onsite}}</span></a></li>
        <li><a href="#">Total Imports <span class="pull-right badge bg-red">{{$import}}</span></a></li>
    </ul>
</div>