<!-- Modal -->
<form id="printLayoutConfigurationForm">
    <div id="name_badge_label" class="modal fade" role="dialog">
        <div class="modal-dialog">

            <!-- Modal content-->
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                    <h4 class="modal-title">Name badge label</h4>
                </div>
                <div class="modal-body">
                    <p id="response_message" style="display: none; text-transform: capitalize; font-weight: bold;">
                        
                    </p>
                    <div class="row">
                        <div class="col col-md-6">
                            <div class="form-group">
                                <label for="usr">Label Name:</label>
                                <input type="text" class="form-control" id="label_name" name="label_name">
                            </div>
                        </div>
                        <div class="col col-md-6">
                            <span id="name_badge_values">
                                <?php
                                    $getAllData         =   DB::table('settings')->where('name','namebadge label')->first();
                                    $listData           =   explode(',', $getAllData->values);
                                ?>
                                <div class="name_badge_values_list">
                                    <ol>
                                        <?php
                                        foreach ($listData as $key=>$data) {
                                            ?>
                                            <li id='name_badge_list_values_{{$key}}'>
                                                <a href="#" onclick="deleteNamebadgeValues('{{$key}}','{{$data}}', '{{ url('su/deleteNamebadgeValues') }}');">{{$data}}
                                                    <span class="fa fa-remove text-danger"></span>
                                                </a>
                                            </li>
                                        <?php } ?>
                                    </ol>
                                </div>
                            </span>
                        </div>
                    </div>                              
                </div>
                <div class="modal-footer">  
                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                    <button type="button" class="btn btn-default" onclick="saveNameBadgeLabel('{{ url('su/saveNameBadgeLabel') }}');">Save</button>
                </div>
            </div>

        </div>
    </div>
</form>