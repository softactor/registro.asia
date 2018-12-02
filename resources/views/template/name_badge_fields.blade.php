<?php
    $font_unit      =   'px';
    $font_size      =   '20';
    $font_weight    =   'normal';
    $font_color     =   '#000000';
    $font_style_json =   $name_badge_config->font_style;
    if(isset($font_style_json) && !empty($font_style_json)){
        $font_style     =   json_decode($font_style_json);
        $font_color     =   $font_style->font_color;
        $font_size      =   $font_style->font_size;
        $font_weight    =   $font_style->font_weight;
    }
    ?>
<div class="general_fields_class"
     style="position: absolute;
     font-weight: {{ $font_weight }};
     font-size: {{ $font_size.$font_unit }};
     color: {{ $font_color }};
     left: {{ $name_badge_config->left_value.'px' }};
     top: {{ $name_badge_config->top_value.'px' }}">
    <?php
    if($field!='qrcode_path'){
        echo $field_value;
    }else{ ?>
        <img src="<?php echo asset('pdf/'.$field_value) ?>" />
    <?php }
    ?>
</div>