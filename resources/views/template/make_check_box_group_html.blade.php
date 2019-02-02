<?php
    if(isset($values->required) && !empty($values->required)){
        $required = '<span style="color:red"> Required</span>';
    }else{
        $required = '';
    }
?>
<h5 style="text-decoration: underline;"><label><?php echo $values->label.$required ; ?>:</label></h5>
<div class="row">
    <?php
    $valueCycleArray = array_chunk($values->values, 5);
    foreach ($valueCycleArray as $valuesData) {
        ?>
        <div class="col-md-4">
            <div class="form-group">
                <?php
                if(isset($values->required) && !empty($values->required)){
                        $field_name =   $values->name.'_required';
                        echo "<input type='hidden' name='$field_name' >";
                    }
                foreach ($valuesData as $val) {
                    ?>
                    <div class="checkbox">
                        <label><input type="checkbox" name="<?php echo $values->name ?>[]" value="<?php echo $val->value; ?>" <?php if(isset($val->selected) && $val->selected==1){ echo 'checked';}?>><?php echo $val->label; ?></label>
                    </div>
                <?php } ?>
            </div> 
        </div> 
    <?php } ?>
</div> 
