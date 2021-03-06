<!--Extends parent app template-->
@extends('layout.app')
<!--Content insert section-->
@section('content')
<section class="container">
    <div class="container-page">
        <div class="row">
            <div class="col-sm-1"><!--left col-->
                @include('layout.superadmin_dashboard_menu')
            </div><!--/col-3-->
            <div class="col-sm-11">
                @include('layout/operation_message') 
                <h2>
                    {{ $page_details['page_title'] }} List
                </h2>
                <?php if(isset($owners_details) && !empty($owners_details)){ ?>
                <div class="panel-group" id="accordion">
                    <div class="panel panel-default">
                        <?php
                            $sl =   1;
                            foreach($owners_details as $details){
                                
                        ?>
                        <div class="panel-heading">
                            <h4 class="panel-title">
                                <a data-toggle="collapse" data-parent="#accordion" href="#collapse<?php echo $details->id; ?>">
                                    <?php echo $details->first_name.' '.$details->last_name; ?>
                                </a>
                                <span class="pull-right">Registered on <?php echo date("F j, Y, g:i a",strtotime($details->created_at));  ?></span>
                            </h4>
                        </div>
                        <div id="collapse<?php echo $details->id; ?>" class="panel-collapse collapse<?php if ($sl == 1) {
                            echo ' in';
                        } ?>">
                                <div class="panel-body">
                                    <div id="registration_area">
                                        <div class="form-group col-lg-6">
                                            <label for="sel1">Salutation</label>
                                            <?php echo $details->salutation; ?>
                                        </div>
                                        <div class="form-group col-lg-6">
                                            <label for="sel1">QR Code</label>                                            
                                            <img src="<?php echo asset('pdf/'.$details->serial_digit.'.png') ?>" />
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
                                            <?php echo (isset($details->namebadge_user_label) && !empty($details->namebadge_user_label) ? $details->namebadge_user_label: 'Visitor'); ?>
                                        </div>
                                        <button type="button" class="button btn-primary" onclick="editBasicRegistrationDetails('<?php echo $details->id; ?>', '{{ url('su/get_event_business_owners_details') }}')">Edit</button>
                                    </div><!-- end of registration_area -->
                                    <?php
                                     foreach (getFormIdByGroupby($details->event_id) as $form) {
                                         // get_data_name_by_where($data);
                                         echo '<h3><u>'.get_data_name_by_id('event_forms',$form->form_id)->lebel_name.'</u></h3>';
                                        foreach (getFormLabelName($form->form_id, $details->business_owner_id) as $fdata) {
                                            echo '<h4>' . $fdata->label_name . '</h4>';
                                            foreach (getLabelValueFormLabelName($fdata->label_name, $details->business_owner_id) as $val) {
                                                echo $val->label_value . '<br>';
                                            }
                                        }
                                    }
                                    ?>
                                </div> <!-- panel body -->
                            </div>
                        <?php $sl++;} ?>
                    </div>
                </div>
                <?php } ?>
            </div><!--/tab-content-->

        </div><!--/col-9-->        
    </div>
</section>
@endsection
@include('modals.registration_edit_modal')