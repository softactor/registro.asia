<?php
    $font_unit      =   'px';
    $font_size      =   '12';
    $font_weight    =   'normal';
    $font_style_json =   $name_badge_config->font_style;
    if(isset($font_style_json) && !empty($font_style_json)){
        $font_style     =   json_decode($font_style_json);
        $font_unit      =   $font_style->font_unit;
        $font_size      =   $font_style->font_size;
        $font_weight    =   $font_style->font_weight;
    }
    ?>
<div class="general_fields_class"
     style="position: relative;
     font-weight: {{ $font_weight }};
     font-size: {{ $font_size.$font_unit }};
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