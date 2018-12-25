<div id="eventnameBadgeTemplateModal" class="modal fade" role="dialog">
    <div class="modal-dialog" style="width: 90%">
        <!-- Modal content-->
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                <h4 class="modal-title"><span id="event_title"></span></h4>
            </div>
            <div class="modal-body">
                <div class="row">                            
                    <div class="col-md-4">
                        <label class="radio-inline">
                            <input type="radio" name="eventNameBadgeTemplateType" value="Default" checked onchange="showTheNameBadgeContainer('Default');">Default
                        </label>
                        <label class="radio-inline">
                            <input type="radio" name="eventNameBadgeTemplateType" value="Custom" onchange="showTheNameBadgeContainer('Custom');">Custom
                        </label>
                    </div>
                </div>
                <div class="row" id="default_template_section">
                    <div class="nameBadgeTemplateContainer">
                        <div class="col-md-4">
                            @include('template/eventDefaultNameBadge1')
                        </div>
                        <div class="col-md-4">
                            @include('template/eventDefaultNameBadge2')
                        </div>
                        <div class="col-md-4">
                            @include('template/eventDefaultNameBadge3')
                        </div>
                    </div>                    
                </div>
                <div class="row" id="custom_template_section">
                    <?php
                        $name_badge_config_url =   url('su/name_badge_config_details');
                    ?>
                    <div class="col-md-12">
                        <div class="row">
                            <div class="col-md-12">
                                <div class="form-group">
                                    <select class="form-control" id="image_path" name="image_path" onchange="update_event_namebadge_background(this.value, '<?php echo $name_badge_config_url; ?>');">
                                        <option value="">Template List</option>
                                    </select>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-2">
                                <div class="ui-widget-content dropable_object draggable" data-absulate-left="1px" data-absulate-top="1px" data-left="10px" data-top="15px" id="serial_digit">Serial digit</div>
                                <div class="ui-widget-content dropable_object draggable" data-absulate-left="1px" data-absulate-top="1px" data-left="10px" data-top="15px" id="qrcode_path">QRcode</div>
                                <div class="ui-widget-content dropable_object draggable" data-absulate-left="1px" data-absulate-top="1px" data-left="10px" data-top="15px" id="salutation">Salutation</div>
                                <div class="ui-widget-content dropable_object draggable" data-absulate-left="" data-absulate-top="" data-left="11px" data-top="12px" id="first_name">First Name</div>
                                <div class="ui-widget-content dropable_object draggable" data-absulate-left="" data-absulate-top="" data-left="12px" data-top="13px" id="last_name">Last Name</div>
                                <div class="ui-widget-content dropable_object draggable" data-absulate-left="" data-absulate-top="" data-left="13px" data-top="14px" id="company_name">Company Name</div>
                                <div class="ui-widget-content dropable_object draggable" data-absulate-left="" data-absulate-top="" data-left="14px" data-top="15px" id="gender">Gender</div>
                                <div class="ui-widget-content dropable_object draggable" data-absulate-left="" data-absulate-top="" data-left="16px" data-top="17px" id="mobile">Mobile</div>
                                <div class="ui-widget-content dropable_object draggable" data-absulate-left="" data-absulate-top="" data-left="18px" data-top="19" id="email">Email</div>
                                <div class="ui-widget-content dropable_object draggable" data-absulate-left="" data-absulate-top="" data-left="18px" data-top="19" id="namebadge_user_label">Namebadge user label</div>
                            </div>
                            <div class="col-md-5">
                                <div id="containment-wrapper">
                                    <div class="defaultEventNameBadgeheader">
                                        <img class="nameBadgeHeader img-responsive"/>
                                    </div>
                                    <div class="center_line"></div>
                                    <div id="content_loader">
                                        <img src="{{ asset('images/content_loading.gif') }}" alt="Wait" />
                                    </div>                    
                                </div>   
                            </div>
                            <div class="col-md-5">
                                <div id="containment-wrapper-preview">
                                    <div class="defaultEventNameBadgeheader">
                                        <img class="nameBadgeHeader img-responsive"/>
                                    </div>
                                    <div class="center_line"></div>
                                    <div class="live_preview_fields" style="position: absolute;" id="preview_serial_digit">Serial digit</div>
                                    <div class="live_preview_fields" style="position: absolute;" id="preview_qrcode_path">QRcode</div>
                                    <div class="live_preview_fields" style="position: absolute;" id="preview_salutation">Salutation</div>
                                    <div class="live_preview_fields" style="position: absolute;" id="preview_first_name">First Name</div>
                                    <div class="live_preview_fields" style="position: absolute;" id="preview_last_name">Last Name</div>
                                    <div class="live_preview_fields" style="position: absolute;" id="preview_company_name">Company Name</div>
                                    <div class="live_preview_fields" style="position: absolute;" id="preview_gender">Gender</div>
                                    <div class="live_preview_fields" style="position: absolute;" id="preview_mobile">Mobile</div>
                                    <div class="live_preview_fields" style="position: absolute;" id="preview_email">Email</div>
                                    <div class="live_preview_fields" style="position: absolute;" id="preview_namebadge_user_label">Visitor</div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-12">
                        <div style="margin: 2% 0;">
                            <?php
                                        $position_store =   url($page_details['position_store']);
                                    ?>
                                    <input type="hidden" id="namebadge_bg_image_path" name="namebadge_bg_image_path" value="{{ $page_details['background_image_path'] }}" />
                                    <input type="hidden" id="position_store" name="position_store" value="{{ $position_store }}" />
                                    <input type="hidden" id="name_badge_id" name="name_badge_id" value="" />
                                    <input type="hidden" id="event_header" name="event_header" value="" />
                                <button id="save" onclick="save_position()">Save Position</button>
                        </div>
                    </div>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
            </div>
        </div>
    </div>
</div>