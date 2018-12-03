<?php

/* 
 * utilities method will be use for access frequently data from every where.
 * there will be custom method for custom result
 * @author: Tanveer Qureshee
 * Date: 01/01/2018
 */

//-----------------------------------------------
//Use model and all facad area
//-----------------------------------------------
use Illuminate\Support\Facades\DB;
use QR_Code\QR_Code;
use Illuminate\Support\Facades\Session;
use Illuminate\Support\Facades\View;
use Illuminate\Support\Facades\URL;
use PDF;
use Mail;

// GET TABLE DATA BY TABLE NAME:

function get_table_data_by_table($table, $order_by  =   null){
    $result     =    DB::table($table);
    if(isset($order_by['order_by'])){
        $result->orderBy($order_by['order_by_column'], $order_by['order_by']);
    }
    return $result->get();
}

// GET TABLE DATA BY TABLE NAME:

function get_data_name_by_id($table,$id){
    return DB::table($table)->where('id', '=', $id)->first();
}

function get_data_name_by_where($table,$where){
    return DB::table($table)->where($where)->first();
}

// CHECK DUPLICATE DATA ENTRY:

function check_duplicate_data($data){
    $result     =    DB::table($data['table'])->where($data['where'])->first();
    if(isset($result) && !empty($result)){
        return $result->id;
    }else{
        return false;
    }
}
// GET TABLE DATA BY TABLE NAME:

function get_table_data_by_clause($data){
    $result     =    DB::table($data['table'])
            ->where($data['where']);
    if(isset($data['order_by'])){
        $result->orderBy($data['order_by_column'], $data['order_by']);
    }
    $result_data    =   $result->get();
    if(isset($result_data) && !empty($result_data)){
        return $result_data;
    }else{
        return false;
    }
} 

function hasAccessPermission($user_id, $page_id, $accessType){
    $return =   false;
    $access = DB::table('page_access as pa')
            ->join('model_has_roles as mhr', 'pa.role_id', '=', 'mhr.role_id')
            ->where('mhr.model_id','=',$user_id)
            ->where('pa.page_id','=',$page_id)
            ->where('pa.'.$accessType,'=',1)
            ->select('pa.*')
            ->get();
    
    if($access->first()){
        $return =   true;
    }
    
    return $return;
}

function getDivisionByDistrict($district_id){
   $return =   false;
    $access = DB::table('admdivisions as div')
            ->join('districts as dis', 'dis.div_id', '=', 'div.id')
            ->where('dis.id','=',$district_id)
            ->select('div.*')
            ->get();
    
    if($access->first()){
        $return =   $access->first();
    }
    
    return $return; 
}

function getDivisionByCC($cc_id){
   $return =   false;
    $access = DB::table('admdivisions as div')
            ->join('citycorporations as dis', 'dis.div_id', '=', 'div.id')
            ->where('dis.id','=',$cc_id)
            ->select('div.*')
            ->get();
    
    if($access->first()){
        $return =   $access->first();
    }
    
    return $return; 
}

function getRoleWiseUser($role_id){
    $users = DB::table('users as u')
            ->join('model_has_roles as mhr', 'u.id', '=', 'mhr.model_id')
            ->join('roles as r', 'r.id', '=', 'mhr.role_id')
            ->where('r.id','=',$role_id)
            ->select(DB::raw('CONCAT(u.first_name,u.last_name) AS name'), "u.id")
            ->get();
    return $users;
}

function getRoleIdByUserId($user_id){
    $role   =   DB::table('model_has_roles as hr')
                ->where('hr.model_id',$user_id)
                ->first();
    return  $role->role_id;
}

function get_project_type_by_project_id($project_id){
    $project_type_data   =   DB::table('projects')
                            ->select('protemp')
                            ->where('id',$project_id)
                            ->first();
    return $project_type_data;    
}

function get_project_progress_id_by_project_id($project_id){
    $project_type_data   =   DB::table('project_progress')
                            ->where('pversion_id',$project_id)
                            ->orderBy('updated_at', 'desc')
                            ->limit(1)
                            ->first();
    return $project_type_data; 
}

function get_project_version_id_by_project_id($project_id){
    $project_type_data   =   DB::table('project_versions')
                            ->where('project_id',$project_id)
                            ->orderBy('updated_at', 'desc')
                            ->limit(1)
                            ->first();
    return $project_type_data; 
}

function check_all_required_table_has_data($project_id){
    $check_result   =   true;
    $table_arrays   =   ['projectdocuments','projectlocations','project_details','projectcosts'];
    foreach($table_arrays as $table){
        if($table == "projectcosts"){
            $latest_project_version =   get_project_version_id_by_project_id($project_id);
            if(isset($latest_project_version) && !empty($latest_project_version)){
                $version_id =   $latest_project_version->id;
                $project_progress   =   get_project_progress_id_by_project_id($version_id);                            
                $progress_id        =   $project_progress->id;
                $data['table']  =   $table;
                $data['where']  =   [
                    'project_id'=>$progress_id
                ];
                $r  =   check_duplicate_data($data);
                if(!$r){
                    return false;
                }
            }
        }else{
            $data['table']  =   $table;
            $data['where']  =   [
                'project_id'=>$project_id
            ];
            $r  =   check_duplicate_data($data);
            if(!$r){
                return false;
            }
        }        
    }// end of foreach
    
    return $check_result;
}

function getLocationCenterCoordinates($data) {
    // get location center coordinates:
    $ceterCordinates    =   DB::table($data['table'])->where($data['where'])->first();
    if($data['location_type']  ==   1) {
        $centerCoordinates_x    =   $ceterCordinates->upz_x;
        $centerCoordinates_y    =   $ceterCordinates->upz_y;
    }else{
        $centerCoordinates_x    =   $ceterCordinates->ward_x;
        $centerCoordinates_y    =   $ceterCordinates->ward_y;
    }
    $calNumber	=	(int)($ceterCordinates->number/72);
    $radious    =   (200+200*$calNumber);
    $angle      =   $ceterCordinates->number * 5;
    $new_co_of_x   =   $centerCoordinates_x + cos($angle) * $radious;
    $new_co_of_y   =   $centerCoordinates_y + sin($angle) * $radious;
    
    $feedback_data      =   [
        'status'                =>  true,//means location has project
        'message'               =>  'Center Coordinates',
        'location-coordinets'   =>  [
            'loc_x' =>  $new_co_of_x,
            'loc_y'=>  $new_co_of_y
        ],
        'update_number'         =>  $ceterCordinates->number+1
    ];
    return $feedback_data;
}

function update_table($data) {
    $result =   DB::table($data['table'])
            ->where($data['where'])
            ->update($data['updates_value']);
    return $result;
    
}

function getTableTotalRows($data){
    $field  =   $data['field'];
    $total_row   =   DB::table($data['table'])
                            ->select(DB::raw("count($field) as total"))
                            ->where($data['where'])
                            ->first();
    return $total_row;
}
function getTableFieldsSum($data){
    $field  =   $data['field'];
    $total_row   =   DB::table($data['table'])
                            ->select(DB::raw("SUM($field) as total"))
                            ->where($data['where'])
                            ->first();
    return $total_row;
}
function getFormIdByGroupby($user_register_id){
    $results = DB::table('event_registeration_form_values as u')
            ->select('form_id')
            ->where('user_register_id', $user_register_id)
            ->groupBy('form_id')
            ->get();
    return $results;
}
function getFormLabelName($form_id, $business_owner_id){
    $results = DB::table('event_registeration_form_values as u')
            ->select('label_name')
            ->where('form_id', $form_id)
            ->where('user_register_id', $business_owner_id)
            ->groupBy('label_name')
            ->get();
    return $results;
}
function getLabelValueFormLabelName($label_name){
    $results = DB::table('event_registeration_form_values as u')
            ->where('label_name', $label_name)
            ->get();
    return $results;
}

function getQRCode($data){
    QR_Code::png($data['serial_number'], $data['pathname']);
}

function get_registration_type_name($regis){
    $name   =   'Online';
    switch($regis){
        case 'OLR':
            $name   =   'Online';
            break;
        case 'OSR':
            $name   =   'Onsite';
            break;
    }
    
    return $name;
}

function generate_name_page_view($data){    
    $user_datas     = DB::table('event_business_owners_details')->whereIn('id', $data)->get();
    $search_data    = View::make('template.name_badge', compact('user_datas'));
    $feedback_data  = [
        'status'    => 'success',
        'message'   => 'Data Found',
        'data'      => $search_data->render()
    ];
    return $feedback_data;
} 
function getNamebadgeFieldsPosition($field, $event_id, $field_value){
    $name_badge_config     = DB::table('name_badge_position')->where('field_id', $field)->where('event_id', $event_id)->first();
    if (isset($name_badge_config)) {
        $search_data           = View::make('template.name_badge_fields', compact('name_badge_config','field_value', 'field'));
        $feedback_data  = [
            'status'    => 'success',
            'message'   => 'Data Found',
            'data'      => $search_data->render()
        ];
    }else{
        $feedback_data  = [
            'status'    => 'error',
            'message'   => 'Data not Found'
        ];
    }
    
    return $feedback_data;
}
function get_registration_type_by_business_owner_id($id){
    $data     = DB::table('event_business_owners')->where('id', $id)->first();
    return $data->registration_type;
}

function get_is_status_by_registration_type($reg_type){
    $status    =   0;
    switch($reg_type){
        case 'Online':
            $status =   1;
            break;
        case 'Onsite':
            $status =   1;
            break;
            default :
            $status =   0;
                break;
    }
    return $status;
}
function get_is_confirmed_by_registration_type($reg_type){
    $status    =   0;
    switch($reg_type){
        case 'Online':
            $status =   1;
            break;
        case 'Onsite':
            $status =   1;
            break;
            default :
            $status =   0;
                break;
    }
    return $status;
}
function generate_pdf($email_n_pdf_data) {
        foreach ($email_n_pdf_data as $prefixKey=>$data) {
            // generate qr code:
            $qrdestPath         = public_path('pdf/');
            $qrfilename         = $data['profile_data']['serial_digit'] . '.png';
            $qr_path_with_file  = $qrdestPath . $qrfilename;
            $qrcodeData         = [
                'pathname'      => $qr_path_with_file,
                'serial_number' => $data['profile_data']['serial_digit']
            ];
            getQRCode($qrcodeData);
            $event_data         = $data['event_data'];
            $pdfTemplateData    = [
                'user_data'     => $data['profile_data'],
                'event_data'    => $event_data,
                'qrcode'        => $qr_path_with_file
            ];
            $destinationPath    = public_path('pdf/');
            $addPrefixNumber    =   $prefixKey+1;
            $name               = $addPrefixNumber.time() . '.pdf';
            $path_with_file     = $destinationPath . $name;
            $pdf = PDF::loadView('template.registration_pdf', $pdfTemplateData)
                    ->save($path_with_file)
                    ->stream('registeration_complete.pdf');
            
            // database update area
            $update_data    =   [
                'qrcode_path'   =>  $qrfilename,
                'pdf_path'      =>  $name
            ];
            DB::table('event_business_owners_details')
            ->where('id', $data['profile_id'])
            ->update($update_data);
            if($data['profile_data']['is_confirmed']){
            
                //--------------------- mail start
                $title                  = "Event Registration";
                $content                = "Congratulations!<br>You have been successfully registered";
                $emails['to']           = $data['profile_data']['email'];
                $emails['attachment']   = $path_with_file;
                $mail                   = Mail::send('template.registration_email', ['title' => $title, 'content' => $pdfTemplateData], function ($message) use ($emails) {
                            $message->from('admin@registro.asia', 'Registro Asia');
                            $message->to($emails['to']);
                            $message->subject("Registro Asia Registration Message");
                            $message->attach($emails['attachment']);
                        });
            }
        }// end foreach
    }
    
    function process_store_event_business_owners($profile_data){
        $namebadge_user_label   =   'visitor';
        /*
         * Namebadge User-label:
         * $namebadge_user_label
         * possible value will be : visitor, organiger 
         * this value will come over the name badge printing section:
         * if the registration_type will be onsite or online it will be automatically set as visitor
         * others registration type will be set as defined by the admin:
         */
        //
        
        $event_business_owners_data    =   [
            'event_id'            => $profile_data['event_id'],
            'owners_numbers'      => $profile_data['owners_numbers'],
            'registration_type'   => $profile_data['registration_type'],
            'is_status'           => get_is_status_by_registration_type($profile_data['registration_type']),
            'created_at'          => date('Y-m-d h:i:s'),
            'updated_at'          => date('Y-m-d h:i:s')
          ]; //end of insert data
        $event_business_owners_id   =   DB::table('event_business_owners')->insertGetId($event_business_owners_data);
        
        if($profile_data['registration_type'] == 'Onsite' || $profile_data['registration_type'] == 'Online'){
            $namebadge_user_label   =   'visitor';
        }
        
        foreach($profile_data['owners_details'] as $pd){
            $pd =   (array)$pd;
            $serialParam    =   [
                'event_id'              =>  $profile_data['event_id'],
                'business_owner_id'     =>  $event_business_owners_id,
            ];
            $serialNumber   =   generate_serial_number($serialParam);
            $event_business_owners_details    =   [
                'event_id'                  => $profile_data['event_id'],
                'business_owner_id'         => $event_business_owners_id,
                'salutation'                => $pd['salutation'],
                'first_name'                => $pd['first_name'],
                'last_name'                 => $pd['last_name'],
                'company_name'              => $pd['company_name'],
                'company_address'           => $pd['company_address'],
                'gender'                    => $pd['gender'],
                'designation'               => $pd['designation'],
                'mobile'                    => $pd['mobile'],
                'country_id'                => (isset($pd['country_id']) && !empty($pd['country_id']) ? $pd['country_id'] : 1),
                'tel'                       => (isset($pd['tel']) && !empty($pd['tel']) ? $pd['tel'] : ''),
                'fax'                       => (isset($pd['fax']) && !empty($pd['fax']) ? $pd['fax'] : ''),
                'email'                     => $pd['email'],
                'serial_digit'              => $serialNumber,
                'namebadge_user_label'      => (isset($pd['namebadge_user_label']) && !empty($pd['namebadge_user_label']) ? $pd['namebadge_user_label'] : $namebadge_user_label),
                'is_status'                 => get_is_status_by_registration_type($profile_data['registration_type']),
                'is_confirmed'              => get_is_confirmed_by_registration_type($profile_data['registration_type']),
                'created_at'                => date('Y-m-d h:i:s'),
                'updated_at'                => date('Y-m-d h:i:s')
              ]; //end of insert data  
            $return_id   =   DB::table('event_business_owners_details')->insertGetId($event_business_owners_details); 
            $insert_ids[]   =   $return_id;
            $pdfData    =   [
                'business_owner_id'    => $event_business_owners_id,
                'profile_id'    => $return_id,
                'profile_data'  => $event_business_owners_details,
                'event_data'    => $profile_data['events_details']
            ];
            // this is store for sending email and generate pdf later
            $email_and_pdf_data[]   =   $pdfData;            
        }// End of foreach loop
        
        return $email_and_pdf_data;
    }
    function generate_serial_number($data){
        $comingDigit    = strlen($data['event_id'].$data['business_owner_id']);
        $digits = (12 - $comingDigit);
        $sd =    str_pad(rand(0, pow(10, $digits)-1), $digits, '0', STR_PAD_LEFT);
        return $sd.$data['event_id'].$data['business_owner_id'];
    }
    
    function email_filtering($email){
        if (!filter_var($email, FILTER_VALIDATE_EMAIL)) {
            return false;
        }
        return true;
    }
    
    function get_settings_value($key){
        $data     = DB::table('settings')->where('name', $key)->first();
        if(isset($data) && !empty($data)){
            switch($data->data_type){
                case 'csv':
                    $get_values = explode(',', $data->values);
                    break;
            }
            return $get_values;
        }
        
    }
    
    //  QUICK REPORT:
    
    function get_quick_report($param){
        $reportType     =   $param['report_type'];
        $reportData     =   [];
        switch($reportType){
            case 'all':
                $dataParam  =   [
                    'report_type'           =>  $reportType,
                ];
                $reportData = get_processed_report_data($dataParam);
                $status     =   'success';
                $message    =   'Data found';
                break;
            case 'last month':
                $startDate  =   date('Y-m-d', strtotime('first day of last month'));
                $endDate   =   date('Y-m-d', strtotime('last day of last month'));
                $dataParam  =   [
                    'startDate'             =>  $startDate,
                    'endDate'               =>  $endDate,
                    'report_type'           =>  $reportType,
                ];
                $reportData = get_processed_report_data($dataParam);
                $status     =   'success';
                $message    =   'Data found';
                break;
            case 'last day':
                $prev_date = date('Y-m-d', strtotime('-1 day'));
                $dataParam  =   [
                    'startDate'             =>  $prev_date,
                    'endDate'               =>  $prev_date,
                    'report_type'           =>  $reportType,
                ];
                $reportData = get_processed_report_data($dataParam);
                $status     =   'success';
                $message    =   'Data found';
                break;
            case 'today':
                $prev_date = date('Y-m-d');
                $dataParam  =   [
                    'startDate'             =>  $prev_date,
                    'endDate'               =>  $prev_date,
                    'report_type'           =>  $reportType,
                ];
                $reportData = get_processed_report_data($dataParam);
                $status     =   'success';
                $message    =   'Data found';
                break;
            default:
                $status     =   'error';
                $message    =   'No report type found';
                break;
        }
        
        return $feedbackData    =   [
            'status'    =>  $status,
            'message'   =>  $message,
            'data'      =>  $reportData
        ];
    }
    
    function get_processed_report_data($param) {
        $totalEventCount     =   0;
        $totalRegisCount     =   0;
        $totalOnlineCount    =   0;
        $totalOnsiteCount    =   0;
        $totalImportCount    =   0;
        // GET TOTAL EVENTS:
        $param['registration_type'] =   'event';
        $eventData  =   get_report_data_by_conditional_type($param);
        if (!$eventData->isEmpty()) { 
            $totalEventCount    =   count($eventData);
        }
        // GET TOTAL Online:
        $param['registration_type'] =   'Online';
        $onlineData  =   get_report_data_by_conditional_type($param);
        if (!$onlineData->isEmpty()) { 
            $totalOnlineCount    =   count($onlineData);
        }
        // GET TOTAL Onsite:
        $param['registration_type'] =   'Onsite';
        $onsiteData  =   get_report_data_by_conditional_type($param);
        if (!$onsiteData->isEmpty()) { 
            $totalOnsiteCount    =   count($onsiteData);
        }
        // GET TOTAL Import:
        $param['registration_type'] =   'Import';
        $importData  =   get_report_data_by_conditional_type($param);
        if (!$importData->isEmpty()) { 
            $totalImportCount    =   count($importData);
        }
        // GET TOTAL registration:
        $param['registration_type'] =   'registration';
        $regisData  =   get_report_data_by_conditional_type($param);
        if (!$regisData->isEmpty()) { 
            $totalRegisCount    =   $regisData[0]->total_owners_numbers;
        }
        
        return $feedbackData   =   [
            'event'         =>$totalEventCount,
            'registeration' =>$totalRegisCount,
            'online'        =>$totalOnlineCount,
            'onsite'        =>$totalOnsiteCount,
            'import'        =>$totalImportCount,
        ];
    }
    
    function get_report_data_by_conditional_type($param) {
        // get all table data:
        if (isset($param['registration_type']) && !empty($param['registration_type']) && $param['registration_type'] == 'event') {
            $query = DB::table('events as p');
            if ($param['report_type'] != 'all') {
                if (isset($param['startDate']) && !empty($param['startDate'])) {
                    $from_date = $param['startDate'] . ' 00:00:00';
                    $query->where('p.created_at', '>=', $from_date);
                }
                if (isset($param['endDate']) && !empty($param['endDate'])) {
                    $to_date = $param['endDate'] . ' 23:59:59';
                    $query->where('p.created_at', '<=', $to_date);
                }
            }
            return $list_data = $query->get();
        } else {
            $query = DB::table('event_business_owners as p');
            if ($param['report_type'] != 'all') {
                if (isset($param['startDate']) && !empty($param['startDate'])) {
                    $from_date = $param['startDate'] . ' 00:00:00';
                    $query->where('p.created_at', '>=', $from_date);
                }
                if (isset($param['endDate']) && !empty($param['endDate'])) {
                    $to_date = $param['endDate'] . ' 23:59:59';
                    $query->where('p.created_at', '<=', $to_date);
                }
            }
            if (isset($param['registration_type']) && !empty($param['registration_type'])) {
                if ($param['registration_type'] == 'event') {
                    $query->groupBy('event_id');
                } elseif ($param['registration_type'] == 'registration') {
                    $query->select(DB::raw("SUM(owners_numbers) as total_owners_numbers"));
                } else {
                    $query->where('p.registration_type', $param['registration_type']);
                }
            }
            return $list_data = $query->get();
        }
    }
