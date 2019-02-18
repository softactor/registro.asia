<!-- Modal -->
<form id="event_wise_email_filtering_form">
    <div id="event_wise_email_filtering" class="modal fade" role="dialog">
        <div class="modal-dialog" style="width: 70%">

            <!-- Modal content-->
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                    <h4 class="modal-title">Email Filter Set</h4>
                </div>
                <div class="modal-body">
                    <p id="response_message" style="display: none; text-transform: capitalize; font-weight: bold;">
                        
                    </p>
                    <div class="row">
                        <div class="col col-md-6">
                            <div class="form-group">
                                <?php 
                                    $url    =   url('su/event_wise_email_filtering');
                                ?>
                                <select class="form-control" id="event_id" name="event_id" onchange="getEventWiseMailDuplicateCheckStatus(this.value, '<?php echo $url; ?>');">
                                    <option value="">Please select</option>
                                    <?php
                                    $events = get_table_data_by_table('events');
                                    foreach ($events as $e) {
                                        ?>
                                        <option value="<?php echo $e->id ?>"><?php echo $e->title ?></option>
                                    <?php } ?>
                                </select>
                            </div>
                            <div class="form-group">
                                <label class="radio-inline">
                                    <input type="radio" id='allow_duplicate_email_check' name="duplicate_email_check" value="yes">Allow Duplicate Email
                                </label>
                                <label class="radio-inline">
                                    <input type="radio" id='dont_allow_duplicate_email_check' name="duplicate_email_check" value="no" checked>Don't Allow Duplicate Email
                                </label>
                            </div>
                        </div>
                    </div>                              
                </div>
                <div class="modal-footer">  
                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                    <button type="button" class="btn btn-default" onclick="store_event_wise_email_filtering('{{ url('su/event_wise_email_filtering_store') }}');">Update</button>
                </div>
            </div>
        </div>
    </div>
</form>