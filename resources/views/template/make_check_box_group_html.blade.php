<h5 style="text-decoration: underline;"><label><?php echo $values->label; ?>:</label></h5>
<div class="row">
    <?php
    $valueCycleArray = array_chunk($values->values, 5);
    foreach ($valueCycleArray as $valuesData) {
        ?>
        <div class="col-md-4">
            <div class="form-group">
                <?php
                foreach ($valuesData as $val) {
                    ?>
                    <div class="checkbox">
                        <label><input type="checkbox" name="<?php echo $values->name ?>[]" value="<?php echo $val->value; ?>"><?php echo $val->label; ?></label>
                    </div>
                <?php } ?>
            </div> 
        </div> 
    <?php } ?>
</div> 
