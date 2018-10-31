<div class="row container-page">				
    <div class="col-md-8">
        <h4>{{ $page_details['base_url'] }}</h4> 

        <div id="<?php echo $step_form_selector; ?>" class="step_form_area">
            <h3>Profile</h3>
            <section>
                <form id="profileSection">
                    <input type="hidden" id="access_token" value="">
                    <input type="hidden" id="event_id" value="<?php echo $events->id; ?>" >
                    <input type="hidden" id="data_url" value="{{ url('su/get_form_json_data') }}" >
                    <input type="hidden" id="client_registration_first_step_varifications" value="{{ url('client_registration_first_step_varifications') }}" >
                    <input type="hidden" id="client_registration_others_step_varifications" value="{{ url('client_registration_others_step_varifications') }}" >
                    <input type="hidden" id="confirmation_process" value="{{ url('confirmation_process') }}" >
                    <input type="hidden" id="redirectUrl" value="{{ url('ongoing_events') }}" >
                    <div id="registration_area">
                        <div class="form-group col-lg-12">
                            <label for="sel1">Salutation<span class="required_title"></span></label>
                            <select class="form-control" id="sel1" name="salutation[]">
                                <option value="">Please select</option>
                                <option value="Mr">Mr</option>
                                <option value="Ms">Ms</option>
                                <option value="Mdm">Mdm</option>
                                <option value="Dr">Dr</option>
                            </select>
                        </div>
                        <div class="form-group col-lg-12">
                            <label>First name<span class="required_title"></span></label>
                            <input type=text"" name="first_name[]" class="form-control" id="" value="">
                        </div>
                        <div class="form-group col-lg-12">
                            <label>Last name<span class="required_title"></span></label>
                            <input type="text" name="last_name[]" class="form-control" id="" value="">
                        </div>            
                        <div class="form-group col-lg-12">
                            <label>Company<span class="required_title"></span></label>
                            <input type="text" name="company_name[]" class="form-control" id="" value="">
                        </div>
                        <div class="form-group col-lg-12">
                            <label>Company address</label>
                            <textarea class="form-control" rows="5" name="company_address[]" id="comment"></textarea>
                        </div>
                        <div class="form-group col-lg-6">
                            <label>Gender</label>
                            <select class="form-control" id="sel1" name="gender[]">
                                <option value="">Please select</option>
                                <option value="Male">Male</option>
                                <option value="Female">Female</option>
                            </select>
                        </div>
                        <div class="form-group col-lg-6">
                            <label>Designation</label>
                            <input type="text" name="designation[]" class="form-control" id="" value="">
                        </div>
                        <div class="form-group col-lg-6">
                            <label>Mobile<span class="required_title"></span></label>
                            <input type="text" name="mobile[]" class="form-control" id="" value="">
                        </div>
                        <div class="form-group col-lg-6">
                            <label>Country<span class="required_title"></span></label>
                            <select class="form-control" id="sel1" name="country_id[]">
                                <option value="">Please select</option>
                                <option value="1">Singpore</option>
                                <option value="2">Canada</option>
                                <option value="3">America</option>
                                <option value="4">China</option>
                            </select>
                        </div>
                        <div class="form-group col-lg-6">
                            <label>Tel</label>
                            <input type="text" name="tel[]" class="form-control" id="" value="">
                        </div>
                        <div class="form-group col-lg-6">
                            <label>Fax</label>
                            <input type="text" name="fax[]" class="form-control" id="" value="">
                        </div>
                        <div class="form-group col-lg-12">
                            <label>Email Address<span class="required_title"></span></label>
                            <input type="" name="email[]" class="form-control" id="" value="">
                        </div>

                        <div class="form-group col-lg-12">
                            <label>Repeat Email Address</label>
                            <input type="" name="rep_email[]" class="form-control" id="" value="">
                        </div>				
                        <div class="form-group col-lg-12">
                            <label>Register additional colleagues?</label>
                            <button type="button" class="btn btn-primary pull-right" onclick="add_more_colleagues();">Add more</button>
                        </div>
                    </div><!-- end of registration_area -->
                    <span id="cloneItem"></span>
                </form>
            </section>
            <?php
            $count = 1;
            foreach ($event_forms as $forms) {
                ?>
                <h3><?php echo $forms->lebel_name; ?></h3>
                <section>
                    <form id="sjfb_form_<?php echo $count; ?>">
                        <input type="hidden" id="generate-form-id-<?php echo $count; ?>" value="">
                        <input type="hidden" id="event-form-id-<?php echo $count; ?>" value="<?php echo $forms->id; ?>">
                        <div id="sjfb_fields_<?php echo $count; ?>">
                        </div>
                    </form>
                </section>
                <?php
                $count++;
            }
            ?>
            <h3>Conformation</h3>
            <section>
                <input type="hidden" id="confirmation_preview_url" value="{{ url('preview_of_registration_confirmation') }}">
                <span id="preconfirm_data"></span>
            </section>
            <?php
                if(isset($page_details['reg_prefix']) && !empty($page_details['reg_prefix']) && $page_details['reg_prefix']=='OSR'){
            ?>
            <h3>Name Badge</h3>
            <section>
                <input type="hidden" id="confirmation_preview_url" value="{{ url('preview_of_registration_confirmation') }}">
                <span id="preconfirm_data"></span>
            </section>
            <?php } ?>
        </div>
    </div>
    <div class="col-md-4">
        <span style="display: inline-block; margin-top: 29%;" id="error_message_show_area"></span>
    </div>
</div>