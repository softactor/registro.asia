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
                <h2>
                    {{ $page_details['page_title'] }} Edit
                    <div class="pull-right">
                        <a href='{{ url($page_details['link_url']) }}'>{{ $page_details['link_title'] }}</a>
                    </div>
                </h2>
                <h4>{{ $page_details['base_url'] }}</h4> 
                
                <div id="edit_events_form" class="step_form_area">
                    <h3>Profile</h3>
                    <section>
                        <form id="profileSection">
                            <input type="hidden" id="event_id" value="<?php echo $events->id; ?>" >
                            <input type="hidden" id="data_url" value="{{ url('su/get_form_json_data') }}" >
                            <input type="hidden" id="store_data_url" value="{{ url('client_registration') }}" >
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
                    </section>
                    <?php
                    $count  =   1;
                    foreach($event_forms as $forms){ ?>
                    <h3><?php echo $forms->lebel_name; ?></h3>
                    <section>
                        <a class="pull-right btn btn-info" href="{{ url('su/modify_events_form/'.$forms->id) }}">Modify</a>
                        <br />
                        <form id="sjfb_form_<?php echo $count; ?>">
                            <input type="hidden" id="event-form-id-<?php echo $count; ?>" value="<?php echo $forms->id; ?>">
                            <div id="sjfb_fields_<?php echo $count; ?>">
                            </div>
                        </form>
                    </section>
                    <?php $count++;} ?>
                    <h3>Conformation</h3>
                    <section>
                        <form id="sjfb_form_conformation">
                            Confirm?
                        </form>
                    </section>
                </div>
            </div><!--/tab-content-->

        </div><!--/col-9-->        
    </div>
</section>
@endsection