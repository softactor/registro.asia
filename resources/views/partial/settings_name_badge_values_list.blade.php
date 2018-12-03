<div class="name_badge_values_list">
    <ol>
        <?php
            foreach($listData as $key=>$data){
        ?>
        <li id='name_badge_list_values_{{$key}}'>
            <a href="#" onclick="deleteNamebadgeValues('{{$key}}','{{$data}}', '{{ url('su/deleteNamebadgeValues') }}');">{{$data}}
                <span class="fa fa-remove text-danger"></span>
            </a>
        </li>
        <?php } ?>
    </ol>
</div>

