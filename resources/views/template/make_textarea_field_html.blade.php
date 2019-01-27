<?php
    if(isset($values->required) && !empty($values->required)){
        $required = '<span style="color:red"> Required</span>';
    }else{
        $required = '';
    }
?>
<div class="row">
    <div class="col-md-12">
        <div class="form-group">
            <?php
            if (isset($values->required) && !empty($values->required)) {
                $field_name = $values->name . '_required';
                echo "<input type='hidden' name='$field_name' >";
            }
            ?>
            <label for="usr"><?php echo $values->label.$required; ?>:</label>
            <textarea class="form-control" rows="5" name="<?php echo $values->name ?>"></textarea>
        </div>
    </div>
</div>

