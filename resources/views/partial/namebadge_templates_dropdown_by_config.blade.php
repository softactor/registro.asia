<option value="">Please select</option>
<?php
foreach ($templates_details as $detials) {
?>
<option value="{{ $detials->image_path }}">
    {{ $detials->template_name }}
</option>
<?php } ?>