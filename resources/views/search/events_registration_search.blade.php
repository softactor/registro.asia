<form id="registared_users_search" action="">
    <div class="form-group">
        <input type="text" class="form-control" id="ticket" name="ticket" placeholder="Ticket">
    </div>
    <div class="form-group">
        <input type="email" class="form-control" id="email" name="email" placeholder="Email">
    </div>
    <div class="form-group">
        <input type="text" class="form-control" id="name" name="name" placeholder="name">
    </div>
    <div class="form-group">
        <input type="text" class="form-control" id="mobile" name="mobile" placeholder="mobile">
    </div>
    <div class="form-group">
        <select class="form-control" id="namebadge_user_label" name="namebadge_user_label">
            <option value="">Please select</option>
            <?php
            $getAllData = DB::table('settings')->where('name', 'namebadge label')->first();
            if (isset($getAllData) && !empty($getAllData)) {
                $listData = explode(',', $getAllData->values);
                foreach ($listData as $key => $data) {
                    ?>
                    <option value="{{$data}}">{{$data}}</option>
                <?php }
            } ?>
        </select>
    </div>
    <div class="form-group">
        <select class="form-control" id="events" name="events">
            <option value="">Events List</option>
            <?php
                foreach($events as $e){
            ?>
            <option value="<?php echo $e->id ?>" <?php if(isset($selected_event_id) && $selected_event_id == $e->id){ echo 'selected'; } ?>><?php echo $e->title ?></option>
            <?php } ?>
        </select>
    </div>
    <input type='hidden' name="search_page_type" value="registration_details_search">
    <button type="button" class="btn btn-default" onclick="searchFilterData('{{ url('su/get_events_registrated_users') }}','registared_users_search','registration_search')">Search</button>
</form>