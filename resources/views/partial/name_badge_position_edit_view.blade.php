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
        style="position: relative;
        left: {{ $pos->left_value.'px' }};
        top: {{ $pos->top_value.'px' }}"
        >
        <span>{{ $pos->field_id }}</span>
        <div class="font_style_and_delete_class_section" id="font_style_and_delete_class_section_id_{{ $pos->id }}">
            <ul>
                <li><span onclick="openStyleEditor('{{$pos->id}}', '{{$pos->field_id}}');"><i class="fa fa-fw fa-pencil-square text-info"></i></span></li>
                <li><span onclick="confirmFieldDelete('{{$pos->id}}', '{{$del_url}}');"><i class="fa fa-fw fa-minus-circle text-danger"></i></span></li>
            </ul>
        </div>
</div>
<?php } ?>

