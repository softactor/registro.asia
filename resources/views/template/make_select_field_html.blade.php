<?php
    if(isset($values->required) && !empty($values->required)){
        $required = '<span style="color:red"> Required</span>';
    }else{
        $required = '';
    }
?>
<div class="form-group">
  <label for="sel1"><?php echo $values->label.$required; ?>:</label>
  <select class="form-control" name="<?php echo $values->name ?>">
      <option value="">Please Select</option>
      <?php      
      foreach ($values->values as $val) {
          ?>
      <option value="<?php echo $val->value; ?>"><?php echo $val->label; ?></option>
      <?php } ?>
  </select>
    <?php 
        if(isset($values->required) && !empty($values->required)){
            $field_name =   $values->name.'_required';
            echo "<input type='hidden' name='$field_name' >";
        }
    ?>
</div>

