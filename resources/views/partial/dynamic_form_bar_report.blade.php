<div class="row">
    <?php 
        foreach ($seriesData as $key=>$cat) {
            $colval =   ceil((12/count($seriesData)));
        ?>
        <div class="col-md-{{$colval}}">
            <div id="dynamic_form_events_{{$key}}" style="min-width: 310px; height: 400px; max-width: 600px; margin: 0 auto"></div>
        </div>
    <?php } ?>
</div>
<div class="row">
    <div class="col-md-6">
        <div id="yearly_events" style="min-width: 310px; height: 400px; max-width: 600px; margin: 0 auto"></div>
    </div>
    <div class="col-md-6">
        <div id="yearly_events_type" style="min-width: 310px; height: 400px; max-width: 600px; margin: 0 auto"></div>
    </div>
</div>
<div class="row">
    <div class="col-md-6">
        <div id="gender_pie_chart" style="min-width: 310px; height: 400px; max-width: 600px; margin: 0 auto"></div>
    </div>
    <div class="col-md-6">
        <div id="designation_pie_chart" style="min-width: 310px; height: 400px; max-width: 600px; margin: 0 auto"></div>
    </div>
</div>
<div class="row">
    <div class="col-md-6">
        <div id="country_pie_chart" style="min-width: 310px; height: 400px; max-width: 600px; margin: 0 auto"></div>
    </div>
    <div class="col-md-6">
        <div id="namebadge_label_pie_chart" style="min-width: 310px; height: 400px; max-width: 600px; margin: 0 auto"></div>
    </div>
</div>