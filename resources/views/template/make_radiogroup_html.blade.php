<h5 style="text-decoration: underline;"><label><?php echo $values->label; ?>:</label></h5>
<div class="row">
    <?php
    $valueCycleArray = array_chunk($values->values, 5);
    foreach ($valueCycleArray as $valuesData) {
        ?>
        <div class="col-md-12">
            <div class="form-group">
                <?php
                foreach ($valuesData as $val) {
                    ?>
                    <label class="radio-inline"><input type="radio" name="<?php echo $values->name ?>" checked><?php echo $val->label; ?></label>
                <?php } ?>
            </div> 
        </div> 
    <?php } ?>
</div> 
