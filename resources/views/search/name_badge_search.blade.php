<form action="/action_page.php">
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
        <select class="form-control" id="events" name="events">
            <option value="">Events List</option>
            <?php
                foreach($events as $e){
            ?>
            <option value="<?php echo $e->id ?>"><?php echo $e->title ?></option>
            <?php } ?>
        </select>
    </div>
    <button type="submit" class="btn btn-default">Search</button>
</form>