<br />
<div class="table-responsive">
    <table id="example2" class="table table-bordered table-hover">
        <thead>
            <tr>
                <th>Check</th>
                <th>SL No.</th>
                <th>Ticket</th>
                <th>Name</th>
                <th>Email</th>
                <th>Mobile</th>
                <th>Type</th>
                <th>Action</th>
            </tr>
        </thead>
        <tbody>
            <?php
            $slNo = 1;
            ?>
            @if(isset($list_data))
            @foreach ($list_data as $data)
            <tr id="data_entry_id_{{$data->id}}">
                <td><input type="checkbox" name="name_badge_check[]" id='nbcheckbox_{{$data->id}}' class='nbcheckbox' value="<?php echo $data->id; ?>" ></td>
                <td class="text-center">{{ $slNo++}}</td>
                <td>{{ $data->serial_digit }}</td>
                <td style="word-wrap: break-word;">{{ $data->first_name.' '.$data->last_name }}</td>
                <td>{{ $data->email }}</td>
                <td>{{ $data->mobile }}</td>
                <td>
                    <?php 
                            $type   =   get_registration_type_by_business_owner_id($data->business_owner_id);
                            if($type == 'Onsite'){
                                echo '<span class="label label-info">'.$type.'</span>';
                            }else{
                                echo '<span class="label label-primary">'.$type.'</span>';
                            }
                    ?>
                </td>
                <td>
                    <?php
                    $whereData = [
                        'event_id' => $data->event_id
                    ];
                    $getConfig = get_data_name_by_where('name_badge_config', $whereData);
                    if(isset($getConfig) && !empty($getConfig)){
                    ?>
                    <button class="btn btn-primary btn-sm" onclick="printSingleNameBadge('{{ url('su/print_events_name_badge') }}', '{{$data->id}}')">Print</button>
                    <?php }else{ ?>
                    <a href="{{ url('su/name_badge_config') }}"><img src="{{ asset('images/print_error.png') }}" title="Namebadge was not configured!"/></a>
                    <?php } ?>
                </td>
            </tr>
            @endforeach
            @else
            <tr>
                <td colspan="6"><div class="no_data_message_style">Sorry, There is no data.</div></td>
            </tr>
            @endif
        </tbody>
    </table>
</div>