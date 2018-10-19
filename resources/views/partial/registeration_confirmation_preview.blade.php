<div class="container">
    <div class="table-responsive">          
        <table class="table">
            <thead>
                <tr>
                    <th colspan=>Details</th>
                </tr>
            </thead>
            <tbody>
                <?php
                foreach ($profile_data->event_business_owners_details as $data) {
                    ?>
                    <tr>                    
                        <td>
                            <div class="row">
                                <div class="col-sm-3 col-md-2 col-5">
                                    <label style="font-weight:bold;">Name</label>
                                </div>
                                <div class="col-md-8 col-6">
                                    <?php echo $data->salutation . ' ' . $data->first_name . ' ' . $data->last_name ?>
                                </div>
                            </div>
                            <hr />

                            <div class="row">
                                <div class="col-sm-3 col-md-2 col-5">
                                    <label style="font-weight:bold;">Company name</label>
                                </div>
                                <div class="col-md-8 col-6">
                                    <?php echo $data->company_name; ?>
                                </div>
                            </div>
                            <hr />


                            <div class="row">
                                <div class="col-sm-3 col-md-2 col-5">
                                    <label style="font-weight:bold;">Email</label>
                                </div>
                                <div class="col-md-8 col-6">
                                    <?php echo $data->email; ?>
                                </div>
                            </div>
                        </td>                    
                    </tr>
                <?php } ?>
                    <tr>
                        <td>
                            <?php
                            foreach ($dyna_form_data as $fdata) {                                
                                $f_data = json_decode($fdata->temp_data);
                                foreach ($f_data as $fkey => $fvalue) {
                                    $label = implode(' ', explode('-', $fkey));
                                    ?>
                                    <h3><?php echo $label ?></h3>
                                    <?php if(is_array($fvalue)){ ?>
                                    <ul>
                                        <?php
                                            foreach($fvalue as $v){
                                        ?>
                                        <li><?php echo $v; ?></li>
                                    </ul>
                                <?php }}}
                            } ?>
                        </td>
                    </tr>    
            </tbody>
        </table>
    </div>
</div>