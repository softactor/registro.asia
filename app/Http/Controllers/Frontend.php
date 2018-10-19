<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Session;
use View;
use Illuminate\Support\Facades\URL;
use PDF;
use Mail;

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
    
    public function confirmation_process(Request $request){
        $get_profile_row_data   =   DB::table('registraion_temp')->where('form_id', 0)->where('access_token', $request->access_token)->first();
        $profile_data           =   json_decode($get_profile_row_data->temp_data);
        // store_event_business_owners
        $this->store_event_business_owners($profile_data);
        $dyna_form_data         =   DB::table('registraion_temp')->where('form_id', '!=' , 0)->where('access_token', $request->access_token)->get();        
        // store_event_registeration_form_values
        $this->store_event_registeration_form_values($dyna_form_data);
        $feedback_data  =   [
            'status'    => "success",
            'data'      => '',
            'message'   => "Registration have done successfully."
        ];
        
        echo json_encode($feedback_data);
    }
    public function store_event_business_owners($profile_data){
        $insert_data    =   [];
        $event_business_owners_details    =   [];
        $event_business_owners_data    =   [
            'event_id'            => $profile_data->event_business_owners_data->event_id,
            'owners_numbers'      => $profile_data->event_business_owners_data->owners_numbers,
            'created_at'          => date('Y-m-d h:i:s'),
            'updated_at'          => date('Y-m-d h:i:s')
          ]; //end of insert data
        $event_business_owners_id   =   DB::table('event_business_owners')->insertGetId($event_business_owners_data);
        foreach($profile_data->event_business_owners_details as $pd){
            $event_business_owners_details    =   [
                'event_id'          => $profile_data->event_business_owners_data->event_id,
                'business_owner_id' => $event_business_owners_id,
                'salutation'        => $pd->salutation,
                'first_name'        => $pd->first_name,
                'last_name'         => $pd->last_name,
                'company_name'      => $pd->company_name,
                'company_address'   => $pd->company_address,
                'gender'            => $pd->gender,
                'designation'       => $pd->designation,
                'mobile'            => $pd->mobile,
                'country_id'        => $pd->country_id,
                'tel'               => $pd->tel,
                'fax'               => $pd->fax,
                'email'             => $pd->email,
                'created_at'        => date('Y-m-d h:i:s'),
                'updated_at'        => date('Y-m-d h:i:s')
              ]; //end of insert data  
            DB::table('event_business_owners_details')->insertGetId($event_business_owners_details);            
        }// End of for loop
    }
    
    public function store_event_registeration_form_values($dyna_form_data){
        foreach ($dyna_form_data as $dfd) {
            $form_data = json_decode($dfd->temp_data);
            foreach ($form_data as $fdKey => $fdValues) {
                if (is_array($fdValues)) {
                    foreach ($fdValues as $v) {
                        $event_form_insert_data = [
                            'event_id'      => $dfd->event_id,
                            'form_id'       => $dfd->form_id,
                            'label_name'    => implode(' ', explode('-', $fdKey)),
                            'label_value'   => $v,
                            'created_at'    => date('Y-m-d h:i:s'),
                            'updated_at'    => date('Y-m-d h:i:s')
                        ]; //end of insert data 
                        DB::table('event_registeration_form_values')->insertGetId($event_form_insert_data);
                    }// end of foreach
                } else {
                    $event_form_insert_data = [
                        'event_id'      => $dfd->event_id,
                        'form_id'       => $dfd->form_id,
                        'label_name'    => implode(' ', explode('-', $fdKey)),
                        'label_value'   => $fdValues,
                        'created_at'    => date('Y-m-d h:i:s'),
                        'updated_at'    => date('Y-m-d h:i:s')
                    ]; //end of insert data  
                    DB::table('event_registeration_form_values')->insertGetId($event_form_insert_data);
                }// end of else            
            }// end of foreach        
        }// end of foreach
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
    public function preview_events_form(Request $request){
        $events        =   DB::table('events')->where('event_url',$request->event_url)->first();
        $event_forms   =   DB::table('event_forms')->where('event_id',$events->id)->get();
        $page_details   =   [
            'page_title'    =>  "Eevnt's form preview",
            'link_url'      =>  '/su/event_form',
            'link_title'    =>  'Preview',
            'base_url'      =>  URL::to("/").'/'.$request->event_url,
        ];
        return view('client_registration', compact('page_details','events','event_forms'));
    }
    
    public function client_registration_first_step_varifications(Request $request) {

        $formData = $request->all();
        $event_id = $formData['event_id'];
        $number_of_owners = count($formData['salutation']);
        // Create a new validator instance
        $validator = Validator::make($request->all(), [
                    "salutation" => "required|array|min:1",
                    "salutation.*" => "required|string|distinct|min:1",
                    "first_name" => "required|array|min:1",
                    "first_name.*" => "required|string|distinct|min:1",
                    "last_name" => "required|array|min:1",
                    "last_name.*" => "required|string|distinct|min:1",
                    "company_name" => "required|array|min:1",
                    "company_name.*" => "required|string|min:1",
                    "mobile" => "required|array|min:1",
                    "mobile.*" => "required|string|distinct|min:1",
                    "country_id" => "required|array|min:1",
                    "country_id.*" => "required|integer|min:1",
                    "email" => "required|array|min:1",
                    "email.*" => "required|email|min:1",
        ]);
        if ($validator->fails()) {
            $form_name = '';
            $messages = '<div class="alert alert-warning">';
            $error_messages = $validator->messages()->getMessages();
            for ($i = 0; $i < $number_of_owners; $i++) {
                $error_counter = 0;
                ;
                $form_counter = $i + 1;
                if ($number_of_owners > 1) {
                    $messages .= '<h3><u>Error on form ' . $form_counter . '</u></h3>';
                } else {
                    $messages .= '<h3><u>Error on form</u></h3>';
                }
                if (isset($error_messages['salutation.' . $i])) {
                    $error_counter = ++$error_counter;
                    $messages .= $error_counter . '. The salutation field is required for ' . '<br />';
                }
                if (isset($error_messages['first_name.' . $i])) {
                    $error_counter = ++$error_counter;
                    $messages .= $error_counter . '. The First Name field is required for ' . '<br />';
                }
                if (isset($error_messages['last_name.' . $i])) {
                    $error_counter = ++$error_counter;
                    $messages .= $error_counter . '. The Last Name field is required for ' . '<br />';
                }
                if (isset($error_messages['company_name.' . $i])) {
                    $error_counter = ++$error_counter;
                    $messages .= $error_counter . '. The Company field is required for ' . '<br />';
                }
                if (isset($error_messages['mobile.' . $i])) {
                    $error_counter = ++$error_counter;
                    $messages .= $error_counter . '. The Mobile field is required for ' . '<br />';
                }
                if (isset($error_messages['country_id.' . $i])) {
                    $error_counter = ++$error_counter;
                    $messages .= $error_counter . '. The Country field is required for ' . '<br />';
                }
                if (isset($error_messages['email.' . $i])) {
                    $error_counter = ++$error_counter;
                    $messages .= $error_counter . '. The Email field is required for ' . '<br />';
                }
            }
            $messages .= '</div>';
            $feedback = [
                'status' => 'error',
                'message' => 'Form have errors',
                'data' => $messages,
            ];
            echo json_encode($feedback);
        } else {
            $insert_data = [];
            $event_business_owners_details = [];
            $event_business_owners_data = [
                'event_id' => $event_id,
                'owners_numbers' => $number_of_owners,
                'created_at' => date('Y-m-d h:i:s'),
                'updated_at' => date('Y-m-d h:i:s')
            ]; //end of insert data
            for ($i = 0; $i < $number_of_owners; $i++) {
                $event_business_owners_details[] = [
                    'event_id'          => $event_id,
                    'business_owner_id' => '',
                    'salutation'        => $formData['salutation'][$i],
                    'first_name'        => $formData['first_name'][$i],
                    'last_name'         => $formData['last_name'][$i],
                    'company_name'      => $formData['company_name'][$i],
                    'company_address'   => $formData['company_address'][$i],
                    'gender'            => $formData['gender'][$i],
                    'designation'       => $formData['designation'][$i],
                    'mobile'            => $formData['mobile'][$i],
                    'country_id'        => $formData['country_id'][$i],
                    'tel'               => $formData['tel'][$i],
                    'fax'               => $formData['fax'][$i],
                    'email'             => $formData['email'][$i],
                    'created_at'        => date('Y-m-d h:i:s'),
                    'updated_at'        => date('Y-m-d h:i:s')
                ]; //end of insert data  
            }// End of for loop
            $temp_data   = [
                    'event_business_owners_data'        =>  $event_business_owners_data,
                    'event_business_owners_details'     =>  $event_business_owners_details,
                ];
            $access_token    =   md5(time());
            $insert_data =  [
                'access_token'      => $access_token,
                'form_id'           => 0,
                'event_id'          => $event_id,
                'temp_data'         => json_encode($temp_data),
                'created_at'        => date('Y-m-d h:i:s'),
                'updated_at'        => date('Y-m-d h:i:s')
            ]; 
            if (isset($formData['access_token']) && !empty($formData['access_token'])) {
                $insert_data =  [
                'form_id'           => 0,
                'event_id'          => $event_id,    
                'access_token'      => $formData['access_token'],
                'temp_data'         => json_encode($temp_data),
                'created_at'        => date('Y-m-d h:i:s'),
                'updated_at'        => date('Y-m-d h:i:s')
            ];
                $profileData = DB::table('registraion_temp')->where('form_id', 0)->where('access_token', $formData['access_token'])->first();
                DB::table('registraion_temp')
                        ->where('id', $profileData->id)
                        ->where('access_token', $formData['access_token'])
                        ->update($insert_data);
                $feedback = [
                    'status' => 'success',
                    'message' => 'Form was valid data',
                    'form_id' => 0,
                    'data' => $formData['access_token'],
                ];
            } else {
                $insert_id = DB::table('registraion_temp')->insertGetId($insert_data);
                $feedback = [
                    'status'    => 'success',
                    'message'   => 'Form was valid data',
                    'form_id' => 0,
                    'data'      => $access_token,
                ];
            }
            echo json_encode($feedback);
        }
    }
    
    public function client_registration_others_step_varifications(Request $request) {

        $formData = $request->all();
        $event_id = $formData['event_id'];
        $access_token = $formData['access_token'];
        $form_id = $formData['form_id'];
        unset($formData['event_id']);
        unset($formData['access_token']);
        unset($formData['form_id']);
        if (isset($formData) && !empty($formData)) {
            if (isset($access_token) && !empty($access_token)) {
                $othersData = DB::table('registraion_temp')->where('form_id', $form_id)->where('access_token', $access_token)->first();
                if (isset($othersData) && !empty($othersData)) {
                    $insert_data = [
                        'access_token' => $access_token,
                        'form_id' => $form_id,
                        'event_id' => $event_id,
                        'temp_data' => json_encode($formData),
                        'created_at' => date('Y-m-d h:i:s'),
                        'updated_at' => date('Y-m-d h:i:s')
                    ];
                    DB::table('registraion_temp')
                            ->where('id', $othersData->id)
                            ->where('access_token', $access_token)
                            ->update($insert_data);
                    $feedback = [
                        'status' => 'success',
                        'message' => 'Form was valid data',
                        'form_id' => $form_id,
                        'data' => $access_token,
                    ];
                } else {
                    $insert_data = [
                        'access_token' => $access_token,
                        'form_id' => $form_id,
                        'event_id' => $event_id,
                        'temp_data' => json_encode($formData),
                        'created_at' => date('Y-m-d h:i:s'),
                        'updated_at' => date('Y-m-d h:i:s')
                    ];
                    $insert_id = DB::table('registraion_temp')->insertGetId($insert_data);
                    $feedback = [
                        'status' => 'success',
                        'message' => 'Form was valid data',
                        'form_id' => $form_id,
                        'data' => $access_token,
                    ];
                }
            }
            $feedback = [
                'status' => 'success',
                'message' => 'Form was valid data',
                'form_id' => $form_id,
                'data' => $access_token,
            ];
            echo json_encode($feedback);
        } else {
            $feedback = [
                'status' => 'error',
                'message' => 'Nothing was selected',
                'data' => $access_token,
            ];
            echo json_encode($feedback);
        }
    }

    public function preview_of_registration_confirmation(Request $request){
        $get_profile_row_data   =   DB::table('registraion_temp')->where('form_id', 0)->where('access_token', $request->access_token)->first();
        $profile_data   = json_decode($get_profile_row_data->temp_data);
        
        $dyna_form_data   =   DB::table('registraion_temp')->where('form_id', '!=' , 0)->where('access_token', $request->access_token)->get();
        $profile_data_view    = View::make('partial.registeration_confirmation_preview', compact('profile_data','dyna_form_data'));
        $feedback_data  = [
            'status'    => 'success',
            'message'   => 'Data Found',
            'data'      => $profile_data_view->render()
        ];
        echo json_encode($feedback_data);
    }
    
    public function pdf_test() {
        $destinationPath = public_path('pdf/');
        $name = time() . '.pdf';
        $path_with_file = $destinationPath . $name;
        $pdf = PDF::loadView('template.test_pdf')
                ->save($path_with_file)
                ->stream('registeration_complete.pdf');
        //--------------------- mail start

        $title = "Event Registration";
        $content = "Congratulations!<br>You have been successfully registered";
        $emails = 'tanveerqureshee1@gmail.com';

        $mail = Mail::send('template.registration_email', ['title' => $title, 'content' => $content], function ($message) use ($emails) {
                    $message->from('admin@registro.asia', 'Registro Asia');
                    $message->to($emails);
                    $message->subject("Registro Asia Registration Message");
                    $message->attach($path_with_file);
                });

        //--------------------- mail end
    }

}
