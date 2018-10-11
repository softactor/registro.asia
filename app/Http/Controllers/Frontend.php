<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Session;
use View;

class Frontend extends Controller
{
    public function index(){
        return view('welcome');
    }
    
    public function client_registration(Request $request){
        $events   =   DB::table('events')->where('event_url',$request->event_url)->first();
        Session::put('client_event_id', $events->id);
        return view('client_registration');
    }
    
    public function process_client_registration(Request $request){
        $all_post_data  =   $request->all();
        $event_id       =   $all_post_data['event'];      
        $number_of_owners       =   count($all_post_data['salutation']);
        $insert_data    =   [];
        $event_business_owners_details    =   [];
        $event_business_owners_data    =   [
                'event_id'            => $event_id,
                'owners_numbers'      => $number_of_owners,
                'created_at'          => date('Y-m-d h:i:s'),
                'updated_at'          => date('Y-m-d h:i:s')
              ]; //end of insert data
            $event_business_owners_id   =   DB::table('event_business_owners')->insertGetId($event_business_owners_data);
        for($i=0; $i < $number_of_owners; $i++){
            $event_business_owners_details    =   [
                'event_id'          => $event_id,
                'business_owner_id' => $event_business_owners_id,
                'salutation'        => $all_post_data['salutation'][$i],
                'first_name'        => $all_post_data['first_name'][$i],
                'last_name'         => $all_post_data['last_name'][$i],
                'company_name'      => $all_post_data['company_name'][$i],
                'company_address'   => $all_post_data['company_address'][$i],
                'gender'            => $all_post_data['gender'][$i],
                'designation'       => $all_post_data['designation'][$i],
                'mobile'            => $all_post_data['mobile'][$i],
                'country_id'        => $all_post_data['country_id'][$i],
                'tel'               => $all_post_data['tel'][$i],
                'fax'               => $all_post_data['fax'][$i],
                'email'             => $all_post_data['email'][$i],
                'created_at'        => date('Y-m-d h:i:s'),
                'updated_at'        => date('Y-m-d h:i:s')
              ]; //end of insert data  
            DB::table('event_business_owners_details')->insertGetId($event_business_owners_details);            
        }// End of for loop
        Session::put('event_business_owners_id', $event_business_owners_id);
        $feedback_data  =   [
            'status'    => "success",
            'data'      => '',
            'message'   => "Registration have done successfully."
        ];
        
        echo json_encode($feedback_data);
    }
    
    public function client_dashboard(){
        //Session::get('event_business_owners_id')
        $registration_details   =   DB::table('event_business_owners_details')->where('business_owner_id',1)->get();
        return view('client_dashboard', compact('registration_details'));
    }
    
    public function client_custome_form_builder(){
        return view('client_custome_form_builder');
    }
    public function ongoing_events(){        
        return view('ongoing_events');
    }
}
