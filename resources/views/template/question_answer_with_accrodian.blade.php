<h2>User wise answers</h2>
<div class="panel-group" id="accordion">
    <?php
    $storeUrl   =   url('su/user_wise_question_answer_store');
    foreach ($profile_data->event_business_owners_details as $key => $profile) {
        ?>    
        <div class="panel panel-default">
            <form id="userWiseFormId_<?php echo $key; ?>">
                <div class="panel-heading">
                    <h4 class="panel-title">
                        <a data-toggle="collapse" data-parent="#accordion" href="#collapse<?php echo $key; ?>">
                            <?php echo $profile->first_name . ' ' . $profile->last_name; ?>
                        </a>
                    </h4>
                </div>
                <div id="collapse<?php echo $key; ?>" class="panel-collapse collapse">
                    <div class="panel-body">
                        <?php echo $all_data; ?>
                        <button type="button" class="btn btn-sm" onclick="storeUserWiseData('userWiseFormId_<?php echo $key; ?>', '<?php echo $storeUrl; ?>', '<?php echo $profile->email; ?>', '<?php echo $key; ?>');">Save</button>
                    </div>
                </div>
            </form>
        </div>
    <?php } ?>
</div>