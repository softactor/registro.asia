<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Session;
use View;
use Illuminate\Support\Facades\URL;
use LaravelQRCode\Facades\QRCode;

class Backend extends Controller
{
    public function dashboard(){
        return view('superadmin.dashboard');
    }
    public function events(){
        $evens_list =   [];
        $events   =   DB::table('events')->get();
        if(!$events->isEmpty()){
            $evens_list =   $events;
        }
        $page_details   =   [
            'page_title'    =>  'Eevnt',
            'link_url'      =>  '/su/create_event',
            'link_title'    =>  'Create'
        ];
        return view('superadmin.events.list', compact('page_details','evens_list'));
    }
    public function edit_event(Request $request){
        $events         =   DB::table('events')->where('event_url',$request->event_url)->first();
        $page_details   =   [
            'page_title'    =>  'Eevnt Edit',
            'events'    =>  $events,
            'link_url'      =>  '/su/events',
            'link_title'    =>  'List',
            'form_url'      =>  '/su/store_event'
        ];
        return view('superadmin.events.edit', compact('page_details', 'events'));
    }
    public function create_event(){
        $page_details   =   [
            'page_title'    =>  'Eevnt',
            'link_url'      =>  '/su/events',
            'link_title'    =>  'List',
            'form_url'    =>  '/su/store_event'
        ];
        return view('superadmin.events.create', compact('page_details'));
    }
    public function store_event(Request $request) {
        $url_string = explode(' ', ucwords($request->title));
        $event_details = [
            'title' => $request->title,
            'organizer' => $request->organizer,
            'start_date' => date('Y-m-d', strtotime($request->start_date)),
            'end_date' => date('Y-m-d', strtotime($request->end_date)),
            'venue_name' => $request->venue_name,
            'venue_address' => $request->venue_address,
            'event_url' => implode('-', $url_string),
            'iframe_events_url' => $request->iframe_events_url,
            'created_at' => date('Y-m-d h:i:s'),
            'updated_at' => date('Y-m-d h:i:s')
        ]; //end of insert data  

        if (isset($request->event_edit_id) && !empty($request->event_edit_id)) {
            DB::table('events')
            ->where('id', $request->event_edit_id)
            ->update($event_details);
            $message    =   'Data have successfully updated.';
        } else {
            DB::table('events')->insertGetId($event_details);
            $message    =   'Data have successfully created.';
        }
        return redirect('/su/events')
                        ->with('success', $message);
    }
    public function event_form(){
        $evens_list =   [];
        $events   =   DB::table('events')->get();
        if(!$events->isEmpty()){
            $evens_list =   $events;
        }
        $page_details   =   [
            'page_title'    =>  'Eevnt form',
            'link_url'      =>  '/su/create_events_form',
            'link_title'    =>  'Create',
            'preview_url'    =>  'su/preview_events_form/'
        ];
        return view('superadmin.events_form.list', compact('page_details','evens_list'));
    }
    public function create_events_form(Request $request){
        $events   =   DB::table('events')->where('event_url',$request->event_url)->first();
        $page_details   =   [
            'page_title'    =>  "Eevnt's form",
            'link_url'      =>  '/su/event_form',
            'link_title'    =>  'Event Form',
            'form_url'      =>  '/su/store_event',
            'base_url'      =>  URL::to("/").'/'.$request->event_url,
        ];
        return view('superadmin.events_form.create', compact('page_details','events'));
    }
    public function edit_events_form(Request $request){
        $events        =   DB::table('events')->where('event_url',$request->event_url)->first();
        $event_forms   =   DB::table('event_forms')->where('event_id',$events->id)->get();
        $page_details   =   [
            'page_title'    =>  "Eevnt's form",
            'link_url'      =>  '/su/event_form',
            'link_title'    =>  'Event Form',
            'base_url'      =>  URL::to("/").'/'.$request->event_url,
        ];
        return view('superadmin.events_form.edit', compact('page_details','events','event_forms'));
    }
    public function preview_events_form(Request $request){
        $events        =   DB::table('events')->where('event_url',$request->event_url)->first();
        $event_forms   =   DB::table('event_forms')->where('event_id',$events->id)->get();
        $page_details   =   [
            'page_title'    =>  "Eevnt's form",
            'link_url'      =>  '/su/event_form',
            'link_title'    =>  'Event Form',
            'base_url'      =>  URL::to("/").'/'.$request->event_url,
            'link_url'      => '/su/event_form',
            'link_title'    => 'Events List',
            'base_url'      => URL::to("/") . '/' . $request->event_url,
            'redirectUrl'   => '/su/event_form',
        ];
        return view('superadmin.events_form.preview', compact('page_details','events','event_forms'));
    }
    public function modify_events_form(Request $request){
        $event_forms   =   DB::table('event_forms')->where('id',$request->form_id)->first();
        $events        =   DB::table('events')->where('id',$event_forms->event_id)->first();
        $page_details   =   [
            'page_title'    =>  "Eevnt's form",
            'link_url'      =>  '/su/event_form',
            'link_title'    =>  'Event Form',
            'form_url'      =>  '/su/store_event',
            'base_url'      =>  URL::to("/").'/'.$events->event_url,
        ];
        return view('superadmin.events_form.modify', compact('page_details','events','event_forms'));
    }
    public function store_events_form(Request $request){
        $all    =   json_decode(file_get_contents('php://input'));
        if(isset($all[3]->value) && !empty($all[3]->value)){
            $event_form_edit_id     =   $all[3]->value;
            $event_forms = [
            'event_id'      => $all[0]->value,
            'lebel_name'    => $all[1]->value,
            'form_data'     => $all[2]->value,
            'created_at'    => date('Y-m-d h:i:s'),
            'updated_at'    => date('Y-m-d h:i:s')
        ]; //end of insert data 
            DB::table('event_forms')
            ->where('id', $event_form_edit_id)
            ->update($event_forms);
            $message    =   'Data have successfully updated';
        }else{
            $event_forms = [
            'event_id'      => $all[0]->value,
            'lebel_name'    => $all[1]->value,
            'form_data'     => $all[2]->value,
            'created_at'    => date('Y-m-d h:i:s'),
            'updated_at'    => date('Y-m-d h:i:s')
        ]; //end of insert data  
        DB::table('event_forms')->insertGetId($event_forms);
        $message    =   'Data have successfully created';
        }
        $feedbackdata   =   [
            'status'    => 'success',
            'message'   => $message,
        ];
        echo json_encode($feedbackdata);
    }
    public function get_form_json_data(Request $request){
        $all_data   =   '';
        $event_forms        =   DB::table('event_forms')->where('id',24)->first();
        $formValues         =   json_decode($event_forms->form_data);
        foreach($formValues as $values){
            switch($values->type){
                case 'checkbox-group':
                    $all_data.=makeCheckBoxGroupHtml($values);    
                    break;
                case 'radio-group':
                    $all_data.=makeRadioGroupHtml($values);    
                    break;
                case 'text':
                    $all_data.=makeTextFieldHtml($values);    
                    break;
                case 'textarea':
                    $all_data.=makeTextAreaFieldHtml($values);    
                    break;
                case 'select':
                    $all_data.=makeSelectFieldHtml($values);    
                    break;
                case 'date':
                    $all_data.=makeCheckBoxGroupHtml($values);    
                    break;
                case 'agree':
                    $all_data.=makeCheckBoxGroupHtml($values);    
                    break;
                case 'header':
                    $all_data.=makeCheckBoxGroupHtml($values);    
                    break;
            } // End of switch   
        } // End of switch
//        $viewFormValues     =   View::make('partial.generate_dynamic_form_view', compact('formValues'));    
//        $event_forms    =   DB::table('event_forms')->where('id',$request->eventFormId)->first();
        $feedbackdata   =   [
            'status'    =>  'success',
            'message'   =>  'Found data',
            'data'      =>  $all_data
        ];
        echo json_encode($feedbackdata);
    }
    public function registration_details_list(){
        $evens_list =   [];
        $events   =   DB::table('events')->get();
        if(!$events->isEmpty()){
            $evens_list =   $events;
        }
        $page_details   =   [
            'page_title'    =>  'Eevnt Registraion Details',
            'link_url'      =>  '/su/create_events_form',
            'link_title'    =>  'Create',
            'preview_url'    =>  'su/preview_events_form/'
        ];
        return view('superadmin.events_registration.registration_details_list', compact('page_details','evens_list'));
    }
    public function registration_details_view(Request $request){
        $owners_details         =   [];
        $owners_details_query   =   DB::table('event_business_owners_details')->where('event_id',$request->event_id)->get();
        $events = DB::table('events')->get();
        if(!$owners_details_query->isEmpty()){
            $owners_details     =   $owners_details_query;
        }
        $page_details           =   [
            'page_title'        =>  'Eevnt Registraion Details',
            'link_url'          =>  '/su/create_events_form',
            'link_title'        =>  'Create',
            'preview_url'       =>  'su/preview_events_form/',
            'events'            =>  $events,
            'selected_event_id' =>  $request->event_id
            
        ];
        return view('superadmin.events_registration.registration_details_view', compact('page_details','owners_details','png'));
    }    
   public function generateEmbeddedEventsUrl(Request $request){
       $url_string  = explode(' ', ucwords($request->event_title));
       $url_text    =   implode('-', $url_string);
       $event_registration_url  =   'https://registro.asia/iframe/event_registration/'.$url_text;
       $view    = View::make('partial.iframe_event_embadded_code', compact('event_registration_url'));
        $feedback_data  = [
            'status'    => 'success',
            'message'   => 'Data Found',
            'data'      => $view->render()
        ];
        echo json_encode($feedback_data);
   }   
   public function backend_registration(Request $request) {
        $events = DB::table('events')->where('event_url', $request->event_url)->first();
        $event_forms = DB::table('event_forms')->where('event_id', $events->id)->get();
        $page_details = [
            'reg_prefix'    => $request->reg_prefix,
            'page_title'    => ((isset($request->reg_prefix) && $request->reg_prefix == 'OSR') ? 'Onsite':'Online')." Eevnt's Registration",
            'link_url'      => '/su/event_form',
            'link_title'    => 'Events List',
            'base_url'      => URL::to("/") . '/' . $request->event_url,
            'redirectUrl'   => 'su/backend/registration/' . $request->event_url.'/'.$request->reg_prefix,
        ];
        return view('superadmin.events_form.backend_registration', compact('page_details', 'events', 'event_forms'));
    }    
    public function name_badge_view(){
        $applicants = DB::table('event_business_owners_details')->get();
        $events = DB::table('events')->get();
        $page_details = [
            'applicants'    => $applicants,
            'events'        => $events,
        ];
        return view('superadmin.events_registration.name_badge_view', compact('page_details'));
    }    
    public function get_registration_tickets(){
        $serial_digits  = DB::table('event_business_owners_details')->pluck('serial_digit');
        $mobiles        = DB::table('event_business_owners_details')->pluck('mobile');
        $emails         = DB::table('event_business_owners_details')->pluck('email');
        $first_names    = DB::table('event_business_owners_details')->pluck('first_name');
        //foreach
        $page_details = [
            'status'    => 'success',
            'message'   => 'Tickest found',
            'data'      => [
                'serial_digits' => $serial_digits,
                'mobiles'       => $mobiles,
                'emails'        => $emails,
                'first_names'   => $first_names,
            ],
        ];
        echo json_encode($page_details);
    }    
    public function get_events_registrated_users(Request $request) {
        // get all table data:
        $query = DB::table('event_business_owners_details as p');
        if (isset($request->ticket) && !empty($request->ticket)) {
            $query->where('p.serial_digit', 'like', '%' . $request->ticket . '%');
        }
        if (isset($request->email) && !empty($request->email)) {
            $query->where('p.email', 'like', '%' . $request->email . '%');
        }
        if (isset($request->name) && !empty($request->name)) {
            $query->where('p.email', 'like', '%' . $request->email . '%');
        }
        if (isset($request->mobile) && !empty($request->mobile)) {
            $query->where('p.mobile', 'like', '%' . $request->mobile . '%');
        }
        if (isset($request->events) && !empty($request->events)) {
            $query->where('p.event_id', 'like', '%' . $request->events . '%');
        }
        if (isset($request->namebadge_user_label) && !empty($request->namebadge_user_label)) {
            $query->where('p.namebadge_user_label', 'like', '%' . $request->namebadge_user_label . '%');
        }
        $list_data = $query->get();
        if ($list_data->isEmpty()) {
            $search_data = View::make('search.events_registrated_users_list');
            $feedback_data = [
                'status' => 'error',
                'message' => 'Data Not Found',
                'data' => $search_data->render()
            ];
        } else {            
            $search_data = View::make('search.events_registrated_users_list', compact('list_data', 'print_url'));
            $feedback_data = [
                'status' => 'success',
                'message' => 'Data Found',
                'data' => $search_data->render()
            ];
        }
        echo json_encode($feedback_data);
    }    
    public function print_events_name_badge(Request $request){
        $ids[]          =   $request->print_id;
        $feedback_data  =   generate_name_page_view($ids);
        echo json_encode($feedback_data);    
    }    
    
    public function print_bulk_name_badge(Request $request){
        $ids    =   $request->name_badge_check;
        $feedback_data  =   generate_name_page_view($ids);
        echo json_encode($feedback_data);    
    }
    
    public function send_bulk_email(Request $request){
        $ids    =   $request->name_badge_check;
        DB::table('event_business_owners_details')->whereIn('id', $ids)->update(array('is_status' => 0));
        $feedback_data  =   [
            'status'=>'success',
            'message'=>'Email on progress',
        ];
        echo json_encode($feedback_data);
    }
    
    public function print_namebadge_status_updater(Request $request){
        $ids    =   $request->name_badge_print;
        foreach($ids as $nameBadgeId){
            $nameBadge_details = [
                'namebadge_id'  => $nameBadgeId,
                'print_date'    => date('Y-m-d h:i:s')
            ]; //end of insert data  
            
            DB::table('namebadge_print_status')->insertGetId($nameBadge_details);
            DB::table('event_business_owners_details')->where('id', $nameBadgeId)->update(array('namebadge_printed_date' => date('Y-m-d h:i:s')));
        }
        $feedback_data  =   [
            'status'=>'success',
            'message'=>'Email on progress',
        ];
        echo json_encode($feedback_data);
    }
    
    public function send_bulk_email_status(){
        $page_details   =   [
            'page_title'    =>  'Email sending status'
        ];
        return view('superadmin.events_registration.send_bulk_email_status', compact('page_details'));
    }
    
    public function csv_uploader_view(Request $request){
        $events         =   DB::table('events')->where('event_url',$request->event_url)->first();
        $page_details   =   [
            'page_title'    =>  'Import CSV',
            'events'        =>  $events,
        ];
        
        return view('superadmin.settings.csv_uploader', compact('page_details'));
    }    
    public function csv_import(Request $request) {
        $x = (object) array();
        $csv_data   =   [];
        $events         =   DB::table('events')->where('event_url',$request->event_url)->first();
        $page_details   =   [
            'page_title'    =>  'Import CSV Details',
            'events'        =>  $events,
        ];
        $file           = $_FILES['registraion']['tmp_name'];
        $csvdata   = $this->csvToArray($file);
        foreach($csvdata as $d){
            $x = (object) array();
            $x->salutation                      =   $d[0];
            $x->first_name                      =   $d[1];
            $x->last_name                       =   $d[2];
            $x->company_name                    =   $d[3];
            $x->company_address                 =   $d[4];
            $x->gender                          =   $d[5];
            $x->designation                     =   $d[6];
            $x->mobile                          =   $d[7];
//            $x->country_id      =   $d[8];
            $x->email                           =   $d[9];
            $x->namebadge_user_label            =   $d[10];
            $csv_data[]          =   $x;
        }
        $csvTempStoreParam  =   [
            'op_type'       => 'add',
            'op_type'       => 'add',
            'temp_data'     => $csv_data,
            'event_id'      =>  $events->id,  
            'total_number'  =>  count($csv_data)
        ];
        $profile_data_param['event_id']           =   $events->id;
        $profile_data_param['owners_numbers']     =   count($csv_data);
        $profile_data_param['registration_type']  =   'Import';
        $profile_data_param['owners_details']     =   $csv_data;
        $profile_data_param['events_details']     =   $events;
        $email_and_pdf_data                       =  process_store_event_business_owners($profile_data_param);
        // create pdf and sent email
        //$check  =   generate_pdf($email_and_pdf_data);
        $business_owner_id  =   $email_and_pdf_data[0]['business_owner_id'];
        $redirect_url   =   'su/backend/registration_import/confirm_csv_uploader/'.$business_owner_id.'/'.$events->event_url;
        return redirect($redirect_url);
    }// end of method;
    public function confirm_csv_uploader(Request $request){
        $events         =   DB::table('events')->where('event_url',$request->event_url)->first();
        $page_details   =   [
            'page_title'                =>  'Import CSV Details',
            'events'                    =>  $events,
            'business_owner_id'         =>  $request->business_owner_id,
        ];
        return view('superadmin.events_registration.confirm_csv_uploader', compact('page_details'));
    }
    public function csvToArray($filename = '', $delimiter = ',') {
        if (!file_exists($filename) || !is_readable($filename))
            return false;

        $header = null;
        $data = array();
        $count  =   1;
        if (($handle = fopen($filename, 'r')) !== false) {
            while ($row = fgetcsv($handle)) {
                if($count==1){
                    $count++;
                    continue;
                }
                $data[]     =     $row;
                
            }
            fclose($handle);
        }

        return $data;
    } // end of method    
    public function csvdatamapping($csvData, $mappingData, $dataObj, $mappingObj){
        foreach($mappingData as $mapping){
            if(strtolower($mapping->$mappingObj) == strtolower($csvData->$dataObj)){
                $csvData->$dataObj     =    $mapping->id;
            }           
        }
        
        return $csvData;
    }    
    public function csv_data_store(Request $request){
        $emailConfirmType    =   false; // default email send status set as false;
        $redirect_url    =   url('su/backend/registration_import_status/'.$is_confirmed.'/'.$event_id); // default email send status set as false;
        $tempData       =    json_decode($request->tempData);
        $total_number   =    count($tempData);   
        $event_id       =    $request->event_id;
        if(isset($request->emailConfirmType) && $request->emailConfirmType == 'withEmail'){
            $emailConfirmType    =   true;
            $redirect_url    =   url('su/registration_details_view/'.$event_id); // default email send status set as false;
        }
        $csvTempStoreParam  =   [
            'op_type'       => 'update',
            'temp_data'     => $tempData,
            'event_id'      =>  $event_id,  
            'emailConfirmType'   =>  $emailConfirmType,  
            'total_number'  =>  $total_number
        ];
        
        $feedbackData   =   $this->process_data_into_temp_csv_import_table($csvTempStoreParam);
        // 'redirect_url'  => url('su/backend/registration_import_status/'.$parent_id.'/'.$event_id)
        $is_confirmed   =   1;
        $feedbackData   =   [
            'status'        => 'success',
            'message'       => 'Data have successfully stored',
            'redirect_url'  => $redirect_url
        ];
        
        echo json_encode($feedbackData);
    }    
    public function registration_import_status(Request $request){
        $is_confirmed   =   $request->is_confirmed;
        $event_id       =   $request->event_id;
        $events         =   DB::table('events')->where('id',$event_id)->first();
        $tempData       =   DB::table('event_business_owners_details')->where('is_confirmed',$is_confirmed)->where('event_id',$event_id)->get();
        $page_details   =   [
            'page_title'    =>  'Import CSV Details Status',
            'events'        =>  $events,
            'tempData'      =>  $tempData,
        ];     
        return view('superadmin.events_registration.registration_import_status', compact('page_details'));
    }    
    public function process_data_into_temp_csv_import_table($data){
        $emailConfirmType           =   $data['emailConfirmType'];
        $tempData           =   $data['temp_data'];
        $event_id           =   $data['event_id'];
        $total_number       =   $data['total_number'];
        if($data['op_type'] == 'add'){
            $paranet_data    =   [
                    'event_id'          => $event_id,
                    'parent_id'         => 0,
                    'total_number'      => $total_number,
                    'salutation'        => '',
                    'first_name'        => '',
                    'last_name'         => '',
                    'company_name'      => '',
                    'company_address'   => '',
                    'gender'            => '',
                    'designation'       => '',
                    'mobile'            => '',
                    'country'           => '',
                    'email'             => '',
                    'status'            => 0,
                    'is_confirmed'      => 0,
                    'created_at'        => date('Y-m-d h:i:s'),
                    'updated_at'        => date('Y-m-d h:i:s')
                  ]; //end of insert data  
            $parent_id   =   DB::table('temp_csv_import_data')->insertGetId($paranet_data);

            foreach($tempData as $pd){
                $child_data    =   [
                    'event_id'          => $event_id,
                    'parent_id'         => $parent_id,
                    'total_number'      => 1,
                    'salutation'        => $pd->salutation,
                    'first_name'        => $pd->first_name,
                    'last_name'         => $pd->last_name,
                    'company_name'      => $pd->company,
                    'company_address'   => $pd->company_address,
                    'gender'            => $pd->gender,
                    'designation'       => $pd->designation,
                    'mobile'            => $pd->mobile,
                    'country'           => $pd->country,
                    'email'             => $pd->email,
                    'status'            => ( ($emailConfirmType) ? 1 : 0),
                    'is_confirmed'      => (isset($pd->is_confirmed) && !empty($pd->is_confirmed) ? $pd->is_confirmed : 0),
                    'created_at'        => date('Y-m-d h:i:s'),
                    'updated_at'        => date('Y-m-d h:i:s')
                  ]; //end of insert data  
                $return_id   =   DB::table('temp_csv_import_data')->insertGetId($child_data);             
            }// End of foreach loop
        }else{
            foreach($tempData as $pd){
                $child_data    =   [
                    'event_id'          => $event_id,
                    'salutation'        => $pd->salutation,
                    'first_name'        => $pd->first_name,
                    'last_name'         => $pd->last_name,
                    'company_name'      => $pd->company,
                    'company_address'   => $pd->company_address,
                    'gender'            => $pd->gender,
                    'designation'       => $pd->designation,
                    'mobile'            => $pd->mobile,
                    'country_id'        => $pd->country,
                    'email'             => $pd->email,
                    'is_status'         => ( ($emailConfirmType) ? 1 : 0),
                    'is_confirmed'      => 1,
                    'updated_at'        => date('Y-m-d h:i:s')
                  ]; //end of insert data  
                DB::table('event_business_owners_details')
                    ->where('id', $pd->id)
                    ->update($child_data);            
            }// End of foreach loop
        }
        $feedbackData   =   [
            'status'        => 'success',
            'message'       => 'Data have successfully stored',
        ];
        
        return $feedbackData;
    }
    
    public function get_event_business_owners_details(Request $request){
        // get all table data:
        $query = DB::table('event_business_owners_details as p');
        if (isset($request->ticket) && !empty($request->ticket)) {
            $query->where('p.serial_digit', 'like', '%' . $request->ticket . '%');
        }
        if (isset($request->email) && !empty($request->email)) {
            $query->where('p.email', 'like', '%' . $request->email . '%');
        }
        if (isset($request->name) && !empty($request->name)) {
            $query->where('p.email', 'like', '%' . $request->email . '%');
        }
        if (isset($request->mobile) && !empty($request->mobile)) {
            $query->where('p.mobile', 'like', '%' . $request->mobile . '%');
        }
        if (isset($request->events) && !empty($request->events)) {
            $query->where('p.event_id', 'like', '%' . $request->events . '%');
        }
        if (isset($request->details_id) && !empty($request->details_id)) {
            $query->where('p.id', $request->details_id);
        }
        $details_data = $query->first();
        $feedback_data = [
            'status'    => 'success',
            'message'   => 'Data Found',
            'data'      => $details_data
        ];
        echo json_encode($feedback_data);
    }
    
    public function user_registration_details(Request $request){
        // get all table data:
        $query  =   DB::table('event_business_owners_details as p');
        if (isset($request->details_id) && !empty($request->details_id)) {
            $query->where('p.id', $request->details_id);
        }
        $details   = $query->first();
        $details_data    = View::make('partial.registration_details_for_modal', compact('details'));
        $feedback_data = [
            'status' => 'success',
            'message' => 'Data Found',
            'data' => $details_data->render()
        ];
        echo json_encode($feedback_data);
    }
    
    public function event_business_owners_details_store(Request $request){
        $details = [
            'salutation'            => $request->salutation,
            'first_name'            => $request->first_name,
            'last_name'             => $request->last_name,
            'company_name'          => $request->company_name,
            'company_address'       => $request->company_address,
            'gender'                => $request->gender,
            'designation'           => $request->designation,
            'mobile'                => $request->mobile,
            'country_id'            => $request->country_id,
            'fax'                   => $request->fax,
            'tel'                   => $request->tel,
            'email'                 => $request->email,
            'namebadge_user_label'  => $request->namebadge_user_label,
            'updated_at'            => date('Y-m-d h:i:s')
        ]; //end of insert data  
        DB::table('event_business_owners_details')
        ->where('id', $request->details_id)
        ->update($details);
        $feedback_data = [
            'status'    => 'success',
            'message'   => 'Data have been successfully updated'
        ];
        echo json_encode($feedback_data);
    }
}
