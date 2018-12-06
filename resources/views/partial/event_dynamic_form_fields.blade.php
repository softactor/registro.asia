<div class="bar_chart_column_section">
    <h4>Select Column for Bar Chart</h4>
    <?php
    foreach (getFormIdByGroupby($event_id) as $form) {
       foreach (getFormLabelByFormId($form->form_id) as $fdata) { ?>
    <div class="checkbox">
        <label><input type="checkbox" name="dataBarColumn[]" value="{{$fdata->label_name}}">{{ucwords(str_replace('_', ' ', $fdata->label_name))}}</label>
    </div>
       <?php }
    }
    ?>
</div>