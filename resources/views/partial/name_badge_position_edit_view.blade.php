<?php

/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
foreach($position_details as $pos){
    $font_unit      =   '';
    $font_size      =   '';
    $font_weight    =   '';
    $font_color     =   '';
    $del_url    =   url('su/name_badge_field_delete');
    $font_style_json =   $pos->font_style;
    if(isset($font_style_json) && !empty($font_style_json)){
        $font_style     =   json_decode($font_style_json);
        $font_color     =   (isset($font_style->font_color) && !empty($font_style->font_color) ? $font_style->font_color : $font_color);
        $font_size      =   $font_style->font_size;
        $font_weight    =   $font_style->font_weight;
    }
    ?>
    <div
        id='del_id_{{$pos->id}}'
        class="general_fields_class edit_field_class"
        style="position: absolute;
        left: {{ $pos->left_value.'px' }};
        top: {{ $pos->top_value.'px' }}"
        >
        <input type="hidden" id="badge_field_font_color_{{$pos->id}}" value="{{ $font_color }}">
        <input type="hidden" id="badge_field_font_size_{{$pos->id}}" value="{{ $font_size }}">
        <input type="hidden" id="badge_field_font_weight_{{$pos->id}}" value="{{ $font_weight }}">
        <span>{{ $pos->field_id }}</span>
        <div class="font_style_and_delete_class_section" id="font_style_and_delete_class_section_id_{{ $pos->id }}">
            <ul>
                <li><span onclick="openStyleEditor('{{$pos->id}}', '{{$pos->field_id}}');"><i class="fa fa-fw fa-pencil-square text-info"></i></span></li>
                <li><span onclick="confirmFieldDelete('{{$pos->id}}', '{{$del_url}}');"><i class="fa fa-fw fa-minus-circle text-danger"></i></span></li>
            </ul>
        </div>
</div>
<?php } ?>

