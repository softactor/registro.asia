<br />
<div class="table-responsive">
    <table id="example2" class="table table-bordered table-hover">
        <thead>
            <tr>
                <th>SL No.</th>
                <th>Ticket</th>
                <th>Name</th>
                <th>Email</th>
                <th>Mobile</th>
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
                <td class="text-center">{{ $slNo++}}</td>
                <td>{{ $data->serial_digit }}</td>
                <td style="word-wrap: break-word;">{{ $data->first_name.' '.$data->last_name }}</td>
                <td>{{ $data->email }}</td>
                <td>{{ $data->mobile }}</td>
                <td>Print</td>
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