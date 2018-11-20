<?php

/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
foreach($position_details as $pos){
    $del_url    =   url('su/name_badge_field_delete');
    ?>
    <div
        id='del_id_{{$pos->id}}'
        class="general_fields_class edit_field_class"
        style="position: relative; left: {{ $pos->left_value.'px' }}; top: {{ $pos->top_value.'px' }}" onclick="confirmFieldDelete('{{$pos->id}}', '{{$del_url}}');">
    {{ $pos->field_id }}
</div>
<?php } ?>

