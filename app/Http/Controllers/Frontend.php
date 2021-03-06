<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Session;
use View;
use Illuminate\Validation\Rule;
use Illuminate\Support\Facades\URL;
use PDF;
use Mail;

class Frontend extends Controller
{
    public function index(){
		// update;
        return view('welcome');
    }    
    public function client_registration(Request $request){
        $events   =   DB::table('events')->where('event_url',$request->event_url)->first();
        Session::put('client_event_id', $events->id);
        return view('client_registration');
    }    
    public function confirmation_process(Request $request){
        // get event details
        $print_data =   [];
        $get_profile_row_data   =   DB::table('registraion_temp')->where('form_id', 0)->where('access_token', $request->access_token)->first();
        $profile_data           =   json_decode($get_profile_row_data->temp_data);
        $event_details  =   DB::table('events')->where('id', $profile_data->event_business_owners_data->event_id)->first();
        // store_event_business_owners
        $response   =   $this->store_event_business_owners($profile_data, $request->access_token, $event_details);
        if($profile_data->event_business_owners_data->registration_type == 'Onsite'){
            $print_data = generate_name_page_view($response);
        }
        DB::table('registraion_temp')->where('access_token', $request->access_token)->delete();
        $feedback_data  =   [
            'registration_type' => $profile_data->event_business_owners_data->registration_type,
            'status'            => "success",
            'data'              => $print_data,
            'message'           => "Registration have done successfully."
        ];
        echo json_encode($feedback_data);
    }
    public function store_event_business_owners($profile_data, $access_token, $event_details){
        $insert_data                        =   [];
        $insert_ids                         =   [];
        $email_and_pdf_data                 =   [];
        $event_business_owners_details      =   [];    
        
        $profile_data_param['event_id']           =   $profile_data->event_business_owners_data->event_id;
        $profile_data_param['owners_numbers']     =   $profile_data->event_business_owners_data->owners_numbers;
        $profile_data_param['registration_type']  =   $profile_data->event_business_owners_data->registration_type;
        $profile_data_param['company_name']       =   $profile_data->event_business_owners_data->company_name;
        $profile_data_param['company_address']    =   $profile_data->event_business_owners_data->company_address;
        $profile_data_param['owners_details']     =   $profile_data->event_business_owners_details;
        $profile_data_param['events_details']     =   $event_details;
        $email_and_pdf_data                       =  process_store_event_business_owners($profile_data_param);
        $dyna_form_data                           =   DB::table('registraion_temp')->where('form_id', '!=' , 0)->where('access_token', $access_token)->get();        
        $event_business_owners_id                 =   $email_and_pdf_data[0]['business_owner_id'];
        // store_event_registeration_form_values
        $this->store_event_registeration_form_values($dyna_form_data, $event_business_owners_id);
        
        // create pdf and sent email
        generate_pdf($email_and_pdf_data);
        return $insert_ids;
    }    
    public function store_event_registeration_form_values($dyna_form_data, $event_business_owners_id){
        foreach ($dyna_form_data as $dfd) {
            $form_data = json_decode($dfd->temp_data);
            foreach ($form_data as $fdKey => $fdValues) {
                if (is_array($fdValues)) {
                    foreach ($fdValues as $v) {
                        $event_form_insert_data = [
                            'user_register_id'  => $event_business_owners_id,
                            'event_id'          => $dfd->event_id,
                            'form_id'           => $dfd->form_id,
                            'user_email'        => $dfd->user_email,
                            'label_name'        => implode(' ', explode('-', $fdKey)),
                            'label_value'       => $v,
                            'created_at'        => date('Y-m-d h:i:s'),
                            'updated_at'        => date('Y-m-d h:i:s')
                        ]; //end of insert data 
                        DB::table('event_registeration_form_values')->insertGetId($event_form_insert_data);
                    }// end of foreach
                } else {
                    $event_form_insert_data = [
                        'user_register_id'  => $event_business_owners_id,
                        'event_id'          => $dfd->event_id,
                        'form_id'           => $dfd->form_id,
                        'user_email'        => $dfd->user_email,
                        'label_name'        => implode(' ', explode('-', $fdKey)),
                        'label_value'       => $fdValues,
                        'created_at'        => date('Y-m-d h:i:s'),
                        'updated_at'        => date('Y-m-d h:i:s')
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
            'reg_prefix'            =>  "OLR",
            'page_title'            =>  "Eevnt's form preview",
            'link_url'              =>  '/su/event_form',
            'link_title'            =>  'Preview',
            'base_url'              =>  URL::to("/").'/'.$request->event_url,
            'redirectUrl'           =>  'ongoing_events',
        ];
        return view('client_registration', compact('page_details','events','event_forms'));
    }    
    public function client_registration_first_step_varifications(Request $request) {

        $formData           = $request->all();
        $event_id           = $formData['event_id'];
        $emails['event_id']= $event_id; 
        $registration_type  = $formData['registration_type'];
        $number_of_owners = count($formData['salutation']);
        
        $settingsWhereData   =   [
            'name'      =>   $event_id,
            'post_type' =>  'duplicate_email_check',
        ];
        $getAllData =   DB::table('settings')->where($settingsWhereData)->first(); 
        if (isset($getAllData) && !empty($getAllData)) {
            if ($getAllData->values == 'yes') {
                $emailDuplicateCheck = true;
            } else {
                $emailDuplicateCheck = false;
            }
        } else {
            $emailDuplicateCheck = false;
        }
        // !$emailDuplicateCheck meaning dont allow event wise duplicate email
        if (!$emailDuplicateCheck) {
            // Create a new validator instance
            $validator = Validator::make($request->all(), [
                        "salutation" => "required|array|min:1",
                        "salutation.*" => "required|string|min:1",
                        "first_name" => "required|array|min:1",
                        "first_name.*" => "required|string|min:1",
                        "last_name" => "required|array|min:1",
                        "last_name.*" => "required|string|min:1",
                        "company_name" => "required",
                        "mobile" => "required|array|min:1",
                        "mobile.*" => "required|string|distinct|min:1",
                        "country_id" => "required|array|min:1",
                        "country_id.*" => "required|integer|min:1",
                        "email" => "required|array|min:1",
                        "email.*" => [
                            'required',
                            'email',
                            'distinct',
                            'min:1',
                            Rule::unique('event_business_owners_details', 'email')->where(function($query) use ($emails) {
                                        $query->where('event_id', '=', $emails['event_id']);
                                    })
                        ],
            ]);
        }else{
            $validator = Validator::make($request->all(), [
                        "salutation" => "required|array|min:1",
                        "salutation.*" => "required|string|min:1",
                        "first_name" => "required|array|min:1",
                        "first_name.*" => "required|string|min:1",
                        "last_name" => "required|array|min:1",
                        "last_name.*" => "required|string|min:1",
                        "company_name" => "required",
                        "mobile" => "required|array|min:1",
                        "mobile.*" => "required|string|distinct|min:1",
                        "country_id" => "required|array|min:1",
                        "country_id.*" => "required|integer|min:1",
                        "email" => "required|array|min:1",
                        "email.*" => [
                            'required',
                            'email',
                            'distinct',
                            'min:1'
                        ],
            ]);
        }
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
                if (isset($error_messages['company_name.'])) {
                    $error_counter = ++$error_counter;
                    $messages .= $error_counter . '. The Company field is required for ' . '<br />';
                }
                if (isset($error_messages['local_state.' . $i])) {
                    $error_counter = ++$error_counter;
                    $messages .= $error_counter . '. The local state field is required for ' . '<br />';
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
                    $messages .= $error_counter . $error_messages['email.' . $i][0] . '<br />';
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
            $insert_data                    = [];
            $event_business_owners_details  = [];
            $event_business_owners_data     = [
                'event_id'              => $event_id,
                'owners_numbers'        => $number_of_owners,
                'registration_type'     => get_registration_type_name($registration_type),
                'company_name'          => $formData['company_name'],
                'company_address'       => $formData['company_address'],
                'created_at'            => date('Y-m-d h:i:s'),
                'updated_at'            => date('Y-m-d h:i:s')
            ]; //end of insert data
            for ($i = 0; $i < $number_of_owners; $i++) {
                $event_business_owners_details[] = [
                    'event_id'          => $event_id,
                    'business_owner_id' => '',
                    'salutation'        => $formData['salutation'][$i],
                    'first_name'        => $formData['first_name'][$i],
                    'last_name'         => $formData['last_name'][$i],                    
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

        $formData       = $request->all();
        $user_email      =   $formData['user_email'];
        $event_id       =   $formData['event_id'];
        $access_token   =   $formData['access_token'];
        $form_id        =   $formData['form_id'];
        unset($formData['user_email']);
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
                        'user_email' => $user_email,
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
                        'user_email' => $user_email,
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
        $dyna_form_data   =   DB::table('registraion_temp')->where('form_id', '!=' , 0)->where('access_token', $request->access_token)->get()->toArray();
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
        $title                  = "Event Registration";
        $content                = "Congratulations!<br>You have been successfully registered";
        $emails['to']           = 'tanveerqureshee1@gmail.com';
        $emails['attachment']   = $path_with_file;

        $mail = Mail::send('template.registration_email', ['title' => $title, 'event_name' => $content], function ($message) use ($emails) {
                    $message->from('admin@registro.asia', 'Registro Asia');
                    $message->to($emails['to']);
                    $message->subject("Registro Asia Registration Message");
                    $message->attach($emails['attachment']);
                });

        //--------------------- mail end
    }
    public function _generate_pdf($email_n_pdf_data) {
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
                'qrcode_path'   =>  $qr_path_with_file,
                'pdf_path'      =>  $path_with_file
            ];
            DB::table('event_business_owners_details')
            ->where('id', $data['profile_data']['id'])
            ->update($update_data);
            if($data['profile_data']['id']){
            
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
    public function generate_serial_number($data){
        $comingDigit    = strlen($data['event_id'].$data['business_owner_id']);
        $digits = (12 - $comingDigit);
        $sd =    str_pad(rand(0, pow(10, $digits)-1), $digits, '0', STR_PAD_LEFT);
        return $sd.$data['event_id'].$data['business_owner_id'];
    }    
//    iframe event registrtion
    public function iframe_events_form(Request $request){
        $events        =   DB::table('events')->where('event_url',$request->event_url)->first();
        $event_forms   =   DB::table('event_forms')->where('event_id',$events->id)->get();
        $page_details   =   [
            'reg_prefix'    =>  "OLR",
            'page_title'    =>  "Eevnt's form preview",
            'link_url'      =>  '/su/event_form',
            'link_title'    =>  'Preview',
            'base_url'      =>  URL::to("/").'/'.$request->event_url,
            'redirectUrl'   =>  'ongoing_events',
        ];
        return view('iframe/iframe_client_registration', compact('page_details','events','event_forms'));
    }
    
    public function send_corn_email(){
        $details   =   DB::table('event_business_owners_details')
                            ->where('is_status',0)
                            ->where('is_confirmed',1)
                            ->take(2)
                            ->get();
        if (!$details->isEmpty()) {
            foreach($details as $d){
                $event_data         =   DB::table('events')->where('id',$d->event_id)->first();
                $pdfTemplateData    = [
                    'user_data'     => (array)$d,
                    'event_data'    => $event_data,
                    'qrcode'        => public_path('pdf/').$d->qrcode_path
                ];
                //--------------------- mail start
                $title                  = "Event Registration";
                $content                = "Congratulations!<br>You have been successfully registered";
                $emails['to']           = $d->email;
                $emails['attachment']   = public_path('pdf/') . $d->pdf_path;
                $mail                   = Mail::send('template.registration_email', ['title' => $title, 'content' => $pdfTemplateData], function ($message) use ($emails) {
                            $message->from('admin@registro.asia', 'Registro Asia');
                            $message->to($emails['to']);
                            $message->subject("Registro Asia Registration Message");
                            $message->attach($emails['attachment']);
                        });
                $child_data =   [
                    'is_status' =>1
                ];
                DB::table('event_business_owners_details')
                            ->where('id', $d->id)
                            ->update($child_data);
            }// end of foreach        
        }
        
    }
    
    public function cron_email_test() {
        $cron_job_status = DB::table('cron_job_status')->where('name', 'email_and_pdf')->first();
        if (!$cron_job_status->is_running) {
            
            $cron_job_status_update =   [
                'is_running'=>1
            ];
            DB::table('cron_job_status')
                        ->where('id', $cron_job_status->id)
                        ->update($cron_job_status_update);
            
            $details = DB::table('event_business_owners_details')
                    ->where('is_status', 0)
                    ->where('is_confirmed', 1)
                    ->where('email', '!=', '')
                    ->take(2)
                    ->get();
            if (!$details->isEmpty()) {
                foreach ($details as $prefixKey => $d) {
                    // generate qr code:
                    $qrdestPath = public_path('pdf/');
                    $qrfilename = $d->serial_digit . '.png';
                    $qr_path_with_file = $qrdestPath . $qrfilename;
                    $qrcodeData = [
                        'pathname' => $qr_path_with_file,
                        'serial_number' => $d->serial_digit
                    ];
                    getQRCode($qrcodeData);
                    $event_data = DB::table('events')->where('id', $d->event_id)->first();

                    $event_data = $event_data;
                    $pdfTemplateData = [
                        'user_data' => $d, //$data['profile_data'],
                        'event_data' => $event_data,
                        'qrcode' => $qr_path_with_file
                    ];

                    $destinationPath = public_path('pdf/');
                    $addPrefixNumber = $prefixKey + 1;
                    $name = $event_data->title . '.pdf';
                    $path_with_file = $destinationPath . $name;
                    $pdf = PDF::loadView('template.registration_pdf', $pdfTemplateData)
                            ->save($path_with_file)
                            ->stream('registeration_complete.pdf');

                    // database update area
                    $update_data = [
                        'qrcode_path' => $qrfilename,
                        'pdf_path' => $name
                    ];
                    DB::table('event_business_owners_details')
                            ->where('id', $d->id)
                            ->update($update_data);

                    if (isset($d->email) && !empty($d->email)) {
                        $pdfTemplateData = [
                            'user_data' => (array) $d,
                            'event_data' => $event_data,
                            'qrcode' => public_path('pdf/') . $d->qrcode_path
                        ];
                        //--------------------- mail start
                        $title = "Event Registration";
                        $content = "Congratulations!<br>You have been successfully registered";
                        $emails['to'] = $d->email;
                        $emails['attachment'] = public_path('pdf/') . $d->pdf_path;
                        $mail = Mail::send('template.registration_email', ['title' => $title, 'content' => $pdfTemplateData], function ($message) use ($emails) {
                                    $message->from('admin@registro.asia', 'Registro Asia');
                                    $message->to($emails['to']);
                                    $message->subject("Registro Asia Registration Message");
                                    $message->attach($emails['attachment']);
                                });


                        $child_data = [
                            'is_status' => 1
                        ];
                        DB::table('event_business_owners_details')
                                ->where('id', $d->id)
                                ->update($child_data);
                    }
                }// end of foreach        
            }
        }
        $cron_job_status_update =   [
                'is_running'=>0
            ];
            DB::table('cron_job_status')
                        ->where('id', $cron_job_status->id)
                        ->update($cron_job_status_update);
    }

}