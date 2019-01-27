<?php
    if(isset($values->required) && !empty($values->required)){
        $required = '<span style="color:red"> Required</span>';
    }else{
        $required = '';
    }
?>
<h5 style="text-decoration: underline;"><label><?php echo $values->label.$required; ?>:</label></h5>
<div class="row">
    <?php
    if(isset($values->required) && !empty($values->required)){
        $field_name =   $values->name.'_required';
        echo "<input type='hidden' name='$field_name' >";
    }
    $valueCycleArray = array_chunk($values->values, 5);
    foreach ($valueCycleArray as $valuesData) {
        ?>
        <div class="col-md-12">
            <div class="form-group">
                <?php
                foreach ($valuesData as $val) {
                    ?>
                    <label class="radio-inline"><input type="radio" name="<?php echo $values->name ?>" value="<?php echo $val->value; ?>" checked><?php echo $val->label; ?></label>
                <?php } ?>
            </div> 
        </div> 
    <?php } ?>
</div> 
