<div class="registration_details_holder">
    <h2>Registration details</h2>
    <div class="table-responsive">          
        <table class="table">
            <tbody>
                <tr>
                    <td>Company Name</td>
                    <td>:</td>
                    <td><?php echo $profile_data->event_business_owners_data->company_name; ?></td>
                </tr>
                <tr>
                    <td colspan="3">
                        <ul class="user_details">
                            <?php
                            foreach ($profile_data->event_business_owners_details as $data) {
                                $dynaFormKey = array_search($data->email, array_column($dyna_form_data, 'user_email'));
                                ?>
                                <li>
                                    <h3>User Details</h3>
                                    <div class="table-responsive">          
                                        <table class="table">
                                            <tbody>
                                                <tr>
                                                    <td>Name</td>
                                                    <td>:</td>
                                                    <td><?php echo $data->salutation . ' ' . $data->first_name . ' ' . $data->last_name ?></td>
                                                </tr>
                                                <tr>
                                                    <td>Email</td>
                                                    <td>:</td>
                                                    <td><?php echo $data->email; ?></td>
                                                </tr>
                                            </tbody>
                                        </table>
                                    </div>
                                    <h3>Answer Details</h3>
                                    <ul class="answer_details">
                                        <?php
                                            $f_data = json_decode($dyna_form_data[$dynaFormKey]->temp_data);
                                                foreach ($f_data as $fkey => $fvalue) {
                                                     $label = implode(' ', explode('-', $fkey));
                                        ?>
                                        <li>
                                            <h4>Q: <?php echo $label ?></h4>
                                            <div class="answer_div_style">
                                                <?php if(is_array($fvalue)){ ?>
                                                    <ul class="answer_details">
                                                        <?php
                                                            foreach($fvalue as $v){
                                                        ?>
                                                        <li><?php echo $v; ?></li>
                                                    </ul>
                                                <?php }// end of foreach

                                                    }else{
                                                        echo '<p>'.$fvalue.'</p>';
                                                    }
                                                ?>
                                            </div>
                                        </li>
                                        <?php } ?>
                                    </ul>
                                </li>
                            <?php } ?>
                        </ul>                                        
                    </td>
                </tr>
            </tbody>
        </table>
    </div>
</div> 