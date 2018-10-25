<link rel="stylesheet" type="text/css" href="http://registro.local/css/jquery.steps.css">
<section class="container">
    <div class="row">				
        <div class="col-md-8">
            <h4>Event name with base url</h4> 

            <div id="profileSectionArea" class="step_form_area">
                <h3>Profile</h3>
                <section>
                    <form id="profileSection">
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
                <h3>Conformation</h3>
                <section>
                    <span id="preconfirm_data">Confirmation Data will come here..</span>
                </section>
            </div>
        </div>
        <div class="col-md-4">
            <span style="display: inline-block; margin-top: 29%;" id="error_message_show_area"></span>
        </div>
    </div>
</section>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-steps/1.1.0/jquery.steps.min.js"></script>
<script>
    $(document).ready(function(){
       $("#profileSectionArea").steps({
            headerTag: "h3",
            bodyTag: "section",
            transitionEffect: "slideLeft",
            autoFocus: true
        });
    });
            
</script>