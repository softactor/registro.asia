<!-- Modal -->
<form id="printLayoutConfigurationForm">
    <div id="print_layout_template" class="modal fade" role="dialog">
        <div class="modal-dialog">

            <!-- Modal content-->
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                    <h4 class="modal-title">Print layout configuration</h4>
                </div>
                <div class="modal-body">
                    <p id="response_message" style="display: none; text-transform: capitalize; font-weight: bold;">
                        
                    </p>
                    <div class="row">
                        <div class="col col-md-12">
                            <div class="form-group">
                                <label for="sel1">Events:</label>
                                <select class="form-control" id="event_id" name="event_id" onchange="get_event_print_configuration(this.value, '{{ url('su/get_event_print_configuration') }}');">
                                    <option value="">Events List</option>
                                    <?php
                                    $events = get_table_data_by_table('events');
                                    foreach ($events as $e) {
                                        ?>
                                        <option value="<?php echo $e->id ?>"><?php echo $e->title ?></option>
                                    <?php } ?>
                                </select>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col col-md-6">
                            <div class="form-group">
                                <label for="usr">Page height:</label>
                                <input type="text" class="form-control" id="page_height" name="page_height">
                            </div>
                        </div>
                        <div class="col col-md-6">
                            <div class="form-group">
                                <label for="usr">Page width:</label>
                                <input type="text" class="form-control" id="page_width" name="page_width">
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col col-md-6">
                            <div class="form-group">
                                <label for="usr">Margin top:</label>
                                <input type="text" class="form-control" id="margin_top" name="margin_top">
                            </div>          

                        </div>
                        <div class="col col-md-6">
                            <div class="form-group">
                                <label for="usr">Margin right:</label>
                                <input type="text" class="form-control" id="margin_right" name="margin_right">
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col col-md-6">
                            <div class="form-group">
                                <label for="usr">Margin bottom:</label>
                                <input type="text" class="form-control" id="margin_bottom" name="margin_bottom">
                            </div>          

                        </div>
                        <div class="col col-md-6">
                            <div class="form-group">
                                <label for="usr">Margin left:</label>
                                <input type="text" class="form-control" id="margin_left" name="margin_left">
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col col-md-6">
                            <div class="form-group">
                                <label for="usr">Font color:</label>
                                <input type="color" class="form-control" id="font_color" name="font_color" value="#000000">
                            </div>          

                        </div>
<!--                        <div class="col col-md-6">
                            <div class="form-group">
                                <label for="usr">Template per page:</label>
                                <input type="text" class="form-control" id="template_per_page" name="template_per_page">
                            </div>
                        </div>-->
                    </div>            
                </div>
                <div class="modal-footer">  
                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                    <button type="button" class="btn btn-default" onclick="savePrintLayoutConfiguration('{{ url('su/savePrintLayoutConfiguration') }}');">Save</button>
                </div>
            </div>

        </div>
    </div>
</form>