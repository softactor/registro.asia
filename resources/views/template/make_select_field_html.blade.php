<div class="form-group">
  <label for="sel1"><?php echo $values->label; ?>:</label>
  <select class="form-control" name="<?php echo $values->name ?>">
      <option value="">Please Select</option>
      <?php
      foreach ($values->values as $val) {
          ?>
      <option value="<?php echo $val->value; ?>"><?php echo $val->label; ?></option>
      <?php } ?>
  </select>
</div>

