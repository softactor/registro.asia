<!-- Modal -->
<form id="printLabelConfiguration">
    <div id="name_badge_label" class="modal fade" role="dialog">
        <div class="modal-dialog" style="width: 70%">

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
                            <div class="form-group">
                                <label for="usr">Text Color:</label>
                                <input type="color" class="form-control" id="text_clor" name="text_clor">
                            </div>
                            <div class="form-group">
                                <label for="usr">BG Color:</label>
                                <input type="color" class="form-control" id="label_color" name="label_color">
                            </div>
                        </div>
                        <div class="col col-md-6">
                            <span id="name_badge_values">
                                <?php
                                    $list_data         =   DB::table('user_label')->get();
                                ?>
                                <div class="table-responsive">
                                    <table class="table table-bordered table-hover">
                                        <thead>
                                            <tr>
                                                <th>SL No.</th>
                                                <th>Name</th>
                                                <th>BG Color</th>
                                                <th>Text Color</th>
                                                <th>Action</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <?php
                                            $slNo = 1;
                                            ?>
                                            @if(isset($list_data))
                                            @foreach ($list_data as $data)
                                            <tr id="name_badge_list_values_{{$data->id}}">
                                                <td class="text-center">{{ $slNo++}}</td>
                                                <td>{{ $data->name }}</td>
                                                <td>
                                                    <div style="width: 25px; height: 25px; background-color: <?php echo $data->background_color; ?>"></div>
                                                </td>
                                                <td>
                                                    <div style="width: 25px; height: 25px; background-color: <?php echo $data->text_clor; ?>"></div>
                                                </td>
                                                <td>
                                                    <a href="#" onclick="deleteNamebadgeValues('{{$data->id}}', '{{ url('su/deleteNamebadgeValues') }}');">
                                                        <span class="fa fa-remove text-danger"></span>
                                                    </a> |
                                                    <button type="button" class="btn btn-sm" onclick="deleteNamebadgeValues('{{$data->id}}', '{{ url('su/deleteNamebadgeValues') }}', 'Edit')">Edit</button>
                                                </td>
                                            </tr>
                                            @endforeach
                                            @else
                                            <tr>
                                                <td colspan="4"><div class="no_data_message_style">Sorry, There is no data.</div></td>
                                            </tr>
                                            @endif
                                        </tbody>
                                    </table>
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