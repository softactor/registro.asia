<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Session;
use View;
use Illuminate\Support\Facades\URL;

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
        return view('superadmin.events/list', compact('page_details','evens_list'));
    }
    public function create_event(){
        $page_details   =   [
            'page_title'    =>  'Eevnt',
            'link_url'      =>  '/su/events',
            'link_title'    =>  'List',
            'form_url'    =>  '/su/store_event'
        ];
        return view('superadmin.events/create', compact('page_details'));
    }
    public function store_event(Request $request) {
        $url_string = explode(' ', ucwords($request->title));
        $event_details = [
            'title' => $request->title,
            'organizer' => $request->organizer,
            'start_date' => $request->start_date,
            'end_date' => $request->end_date,
            'venue_name' => $request->venue_name,
            'venue_address' => $request->venue_address,
            'event_url' => implode('-', $url_string),
            'created_at' => date('Y-m-d h:i:s'),
            'updated_at' => date('Y-m-d h:i:s')
        ]; //end of insert data  
        DB::table('events')->insertGetId($event_details);
        return redirect('/su/events')
                        ->with('success', 'Data have successfully created.');
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
        return view('superadmin.events_form/list', compact('page_details','evens_list'));
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
        return view('superadmin.events_form/create', compact('page_details','events'));
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
        return view('superadmin.events_form/edit', compact('page_details','events','event_forms'));
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
        return view('superadmin.events_form/preview', compact('page_details','events','event_forms'));
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
        return view('superadmin.events_form/modify', compact('page_details','events','event_forms'));
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
        return view('superadmin.events_registration/registration_details_list', compact('page_details','evens_list'));
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
        return view('superadmin.events_registration/registration_details_view', compact('page_details','owners_details'));
    }
}
