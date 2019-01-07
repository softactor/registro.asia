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
                    <a href="#" onclick="deleteNamebadgeValues('{{$data->id}}', '{{ url('su / deleteNamebadgeValues') }}');">
                        <span class="fa fa-remove text-danger"></span>
                    </a>
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
