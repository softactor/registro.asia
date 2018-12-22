    <div class="form-group col-lg-6">
        <label for="sel1">Salutation</label>
        <?php echo $details->salutation; ?>
    </div>
    <div class="form-group col-lg-6">
        <label for="sel1">QR Code</label>                                            
        <img src="<?php echo asset('pdf/' . $details->serial_digit . '.png') ?>" />
    </div>
    <div class="form-group col-lg-6">
        <label>First name</label>
        <?php echo $details->first_name; ?>
    </div>
    <div class="form-group col-lg-6">
        <label>Last name</label>
        <?php echo $details->last_name; ?>
    </div>            
    <div class="form-group col-lg-6">
        <label>Company</label>
        <?php echo $details->company_name; ?>
    </div>
    <div class="form-group col-lg-6">
        <label>Company address</label>
        <?php echo $details->company_address; ?>
    </div>
    <div class="form-group col-lg-6">
        <label>Gender</label>
        <?php echo $details->gender; ?>
    </div>
    <div class="form-group col-lg-6">
        <label>Designation</label>
        <?php echo $details->designation; ?>
    </div>
    <div class="form-group col-lg-6">
        <label>Mobile</label>
        <?php echo $details->mobile; ?>
    </div>
    <div class="form-group col-lg-6">
        <label>Country</label>
        <?php echo $details->country_id; ?>
    </div>
    <div class="form-group col-lg-6">
        <label>Tel</label>
        <?php echo $details->tel; ?>
    </div>
    <div class="form-group col-lg-6">
        <label>Fax</label>
        <?php echo $details->fax; ?>
    </div>
    <div class="form-group col-lg-12">
        <label>Email Address</label>
        <?php echo $details->email; ?>
    </div>
    <div class="form-group col-lg-12">
        <label>Name Badge User Label</label>
        <?php echo (isset($details->namebadge_user_label) && !empty($details->namebadge_user_label) ? $details->namebadge_user_label : 'Visitor'); ?>
    </div>
<?php
foreach (getFormIdByGroupby($details->event_id) as $form) {
    // get_data_name_by_where($data);
    echo '<h3><u>' . get_data_name_by_id('event_forms', $form->form_id)->lebel_name . '</u></h3>';
    foreach (getFormLabelName($form->form_id, $details->business_owner_id) as $fdata) {
        echo '<h4>' . $fdata->label_name . '</h4>';
        foreach (getLabelValueFormLabelName($fdata->label_name, $details->business_owner_id) as $val) {
            echo $val->label_value . '<br>';
        }
    }
}
?>