<div class="form-group">
    <ul class="saved_templates">
        <?php
        foreach ($templates_details as $detials) {
            //print_r($detials->template_name);
            //print_r($detials->image_path);
            ?>
            <li id="del_id_<?php echo $detials->id; ?>">
                <input type="text" class="form-control" name="saved_template_name[{{ $detials->id }}]" value="{{ $detials->template_name }}">
                <div class="outer">
                    <div class="inner">
                        <img src="{{ asset('namebadge/'.$detials->image_path) }}" alt="Wait" />
                    </div>
                </div>
                <button type="button" class="button btn-danger" onclick="deleteNameBadgeSavedTemplate('{{ $detials->id }}', '{{ url('su/name_badge_template_delete') }}')">Delete</button>
            </li>
        <?php } ?>
    </ul>
</div>