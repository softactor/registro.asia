<br />
<div class="table-responsive">
    <table id="example2" class="table table-bordered table-hover">
        <thead>
            <tr>
                <th>SL No.</th>
                <?php
                    foreach($columnNames as $column){
                        $v  =   str_replace('_', ' ', $column);
                ?>
                <th>{{ ucwords($v) }}</th>
                <?php } ?>
            </tr>
        </thead>  
        <tbody>
            <?php
            $slNo = 1;
            ?>
            @if(isset($listData))
            @foreach ($listData as $data)
            <tr>
                <td class="text-center">{{ $slNo++}}</td>
                <?php
                    foreach($columnNames as $column){
                ?>
                <td>{{ $data->{$column} }}</td>
            <?php } ?>
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