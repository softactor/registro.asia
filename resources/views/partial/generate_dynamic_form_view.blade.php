<?php
    $all_data   =   '';
    foreach($formValues as $values){
        switch($values->type){
            case 'checkbox-group':
                $all_data.=makeCheckBoxGroupHtml($values);    
                break;
        } // End of switch   
    } // End of switch
    return $all_data;


