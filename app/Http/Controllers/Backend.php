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
        $event_forms    =   DB::table('event_forms')->where('id',$request->eventFormId)->first();
        $feedbackdata   =   [
            'status'    =>  'success',
            'message'   =>  'Found data',
            'data'      =>  $event_forms
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
        $owners_details =   [];
        $owners_details_query   =   DB::table('event_business_owners_details')->where('event_id',$request->event_id)->get();
        if(!$owners_details_query->isEmpty()){
            $owners_details =   $owners_details_query;
        }
        $page_details   =   [
            'page_title'    =>  'Eevnt Registraion Details',
            'link_url'      =>  '/su/create_events_form',
            'link_title'    =>  'Create',
            'preview_url'    =>  'su/preview_events_form/'
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
        $list_data = $query->get();
        if ($list_data->isEmpty()) {
            $search_data = View::make('search.events_registrated_users_list', compact('list_data', 'print_url'));
            $feedback_data = [
                'status' => 'error',
                'message' => 'Data Not Found',
                'data' => $search_data->render()
            ];
        } else {
            $search_data = View::make('search.events_registrated_users_list', compact('list_data'));
            $feedback_data = [
                'status' => 'success',
                'message' => 'Data Found',
                'data' => $search_data->render()
            ];
        }
        echo json_encode($feedback_data);
    }

}
