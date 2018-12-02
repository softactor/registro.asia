<!-- Modal -->
<div id="registrationEditModal" class="modal fade" role="dialog">
  <div class="modal-dialog">

    <!-- Modal content-->
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal">&times;</button>
        <h4 class="modal-title">Registration details</h4>
      </div>
      <div class="modal-body">
          <div style="clear: both; display: inline-block;">
              <form class="form-horizontal" id="registration_details_edit_view">
                    <div class="form-group col-lg-12">
                        <label for="sel1">Salutation<span class="required_title"></span></label>
                        <select class="form-control" id="salutation" name="salutation">
                            <option value="">Please select</option>
                            <option value="Mr">Mr</option>
                            <option value="Ms">Ms</option>
                            <option value="Mdm">Mdm</option>
                            <option value="Dr">Dr</option>
                        </select>
                    </div>
                    <div class="form-group col-lg-12">
                        <label>First name<span class="required_title"></span></label>
                        <input type=text"" name="first_name" class="form-control" id="first_name" value="">
                    </div>
                    <div class="form-group col-lg-12">
                        <label>Last name<span class="required_title"></span></label>
                        <input type="text" name="last_name" class="form-control" id="last_name" value="">
                    </div>            
                    <div class="form-group col-lg-12">
                        <label>Company<span class="required_title"></span></label>
                        <input type="text" name="company_name" class="form-control" id="company_name" value="">
                    </div>
                    <div class="form-group col-lg-12">
                        <label>Company address</label>
                        <textarea class="form-control" rows="5" name="company_address" id="company_address"></textarea>
                    </div>
                    <div class="form-group col-lg-6">
                        <label>Gender</label>
                        <select class="form-control" id="gender" name="gender">
                            <option value="">Please select</option>
                            <option value="Male">Male</option>
                            <option value="Female">Female</option>
                        </select>
                    </div>
                    <div class="form-group col-lg-6">
                        <label>Designation</label>
                        <input type="text" name="designation" class="form-control" id="designation" value="">
                    </div>
                    <div class="form-group col-lg-6">
                        <label>Mobile<span class="required_title"></span></label>
                        <input type="text" name="mobile" class="form-control" id="mobile" value="">
                    </div>
                    <div class="form-group col-lg-6">
                        <label>Country<span class="required_title"></span></label>
                        <select class="form-control" id="country_id" name="country_id">
                            <option value="">Please select</option>
                            <option value="1">Singpore</option>
                            <option value="2">Canada</option>
                            <option value="3">America</option>
                            <option value="4">China</option>
                        </select>
                    </div>
                    <div class="form-group col-lg-6">
                        <label>Tel</label>
                        <input type="text" name="tel" class="form-control" id="tel" value="">
                    </div>
                    <div class="form-group col-lg-6">
                        <label>Fax</label>
                        <input type="text" name="fax" class="form-control" id="fax" value="">
                    </div>
                    <div class="form-group col-lg-12">
                        <label>Email Address<span class="required_title"></span></label>
                        <input type="" name="email" class="form-control" id="email" value="">
                    </div>
                    <div class="form-group col-lg-12">
                        <label for="sel1">User Label type<span class="required_title"></span></label>
                        <select class="form-control" id="namebadge_user_label" name="namebadge_user_label">
                            <option value="">Please select</option>
                            <option value="visitor">Visitor</option>
                            <option value="organizer">Organizer</option>
                        </select>
                    </div>
                  <input type='hidden' name="details_id" id="details_id" value="">
                </form>
          </div>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        <button type="button" class="btn btn-primary" onclick="updateUserRegisterationData('{{ url('su/event_business_owners_details_store') }}');">Update</button>
      </div>
    </div>

  </div>
</div>