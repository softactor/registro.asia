<!--Extends parent app template-->
@extends('layout.app')
<!--Content insert section-->
@section('content')
<section class="container">
    <div class="container-page">				
        <div class="col-md-6">
            <form id="eventRegistration">
                <h3 class="dark-grey">Register your details here</h3>
                <div class="form-group col-lg-12">
                        <label for="sel1">Events</label>
                        <?php
                        $events = get_table_data_by_table('events');
                        ?>
                        <select class="form-control" id="sel1" name="event">
                            <option value="">Please select</option>
                            <?php 
                                foreach($events as $event){
                            ?>
                            <option value="<?php echo $event->id ?>"><?php echo $event->title ?></option>
                            <?php } ?>
                        </select>
                    </div>
                <div id="registration_area">
                    <div class="form-group col-lg-12">
                        <label for="sel1">Salutation</label>
                        <select class="form-control" id="sel1" name="salutation[]">
                            <option value="">Please select</option>
                            <option value="Mr">Mr</option>
                            <option value="Ms">Ms</option>
                            <option value="Mdm">Mdm</option>
                            <option value="Dr">Dr</option>
                        </select>
                    </div>
                    <div class="form-group col-lg-12">
                        <label>First name</label>
                        <input type=text"" name="first_name[]" class="form-control" id="" value="">
                    </div>
                    <div class="form-group col-lg-12">
                        <label>Last name</label>
                        <input type="text" name="last_name[]" class="form-control" id="" value="">
                    </div>            
                    <div class="form-group col-lg-12">
                        <label>Company</label>
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
                        <label>Mobile</label>
                        <input type="text" name="mobile[]" class="form-control" id="" value="">
                    </div>
                    <div class="form-group col-lg-6">
                        <label>Country</label>
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
                        <label>Email Address</label>
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
        </div>

        <div class="col-md-6">
            <h3 class="dark-grey">Terms and Conditions</h3>
            <p>
                Ensure all details are correct as this will be printed on your show badge.
            </p>
            <p>
                All visitors must be registered to receive a unique entry badge
            </p>
            <p>
                We will use your details on all future communications, including your event badge. 
            </p>

            <button type="submit" class="btn btn-primary" onclick="registerBusinessOwners('{{ url("/client_registration") }}', 'eventRegistration', '/client_dashboard');">Register</button>
        </div>
    </div>
</section>
@endsection