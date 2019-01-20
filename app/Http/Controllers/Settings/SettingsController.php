<?php

namespace App\Http\Controllers\Settings;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Model\Settings\PrintLayoutConfigurationModel;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Facades\DB;
use View;

class SettingsController extends Controller{
    public function index(){
        $page_details   =   [
            'page_title'    =>  'Settings',
            'link_url'      =>  '/su/create_settings',
            'link_title'    =>  'Create'
        ];
        return view('superadmin.settings.list', compact('page_details'));
    }
    
    public function get_event_print_configuration(Request $request){
        $where          = ['event_id' => $request->event_id];
        $configData     =    PrintLayoutConfigurationModel::where($where)->first();
        if(isset($configData) && !empty($configData)){
            $configuration_data     = json_decode($configData->print_config_values);
            $feedback   =   [
                'status'    => 'success',
                'message'   => 'configuration found',
                'data'      => $configuration_data
            ];
        }else{
            $feedback   =   [
                'status'    => 'error',
                'message'   => 'configuration not found, the following value is default value',
                'data'      => ''
            ];
        }
        
        echo json_encode($feedback);
    }
    
    public function savePrintLayoutConfiguration(Request $request){
        $all    =   $request->all();
        $where          = ['event_id' => $request->event_id];
        $configData     =    PrintLayoutConfigurationModel::where($where)->first();
        if(isset($configData) && !empty($configData)){
            $update_response    =   PrintLayoutConfigurationModel::where($where)->update(['print_config_values' => json_encode($all)]);
            $feedback   =   [
                'status'    => 'success',
                'message'   => 'Data have successfully updated',
                'data'      => ''
            ];
        }else{
            $createData     =   [
                'event_id'              =>  $request->event_id,
                'print_config_values'   =>  json_encode($all),
            ];
            $create_response    =   PrintLayoutConfigurationModel::create($createData);
            $feedback   =   [
                'status'    => 'success',
                'message'   => 'Data have successfully created',
                'data'      => ''
            ];
        }

        echo json_encode($feedback);
    }
    
    public function saveNameBadgeLabel(Request $request){
        $labelData  =   [
            'name'              =>  $request->label_name,
            'background_color'  =>  $request->label_color,
            'text_clor'  =>  $request->text_clor,
        ];
        $getAllData =   DB::table('user_label')->where('name',$request->label_name)->first(); 
        if(isset($getAllData) && !empty($getAllData)){
            DB::table('user_label')
            ->where('id', $getAllData->id)
            ->update($labelData);
            
        }else{
            DB::table('user_label')->insert($labelData);
        }
        $list_data           =   DB::table('user_label')->get();
        $listDataView       =   View::make('partial.settings_name_badge_values_list', compact('list_data'));
        $feedbackData   =   [
            'status'    =>  'success',
            'message'   => 'Successfully updated',
            'data'      => $listDataView->render()
        ];
        echo json_encode($feedbackData);
    }
    
    public function deleteNamebadgeValues(Request $request) {
        $actionType =   $request->typeParam_;
        if($actionType == 'Delete'){
            DB::table('user_label')->where('id', $request->del_id)->delete();
            $feedbackData   =   [
                'status'    =>  'success',
                'message'   => 'Successfully Deleted'
            ];
        }else{
            $data   =   DB::table('user_label')->where('id', $request->del_id)->first();
            $feedbackData   =   [
                'status'    =>  'success',
                'data'      => $data,
                'message'   => 'Successfully Deleted'
            ];
        }
        echo json_encode($feedbackData);
    }
    
    public function eventWiseMailComposer(){
        $page_details   =   [
            'page_title'    =>  'Mail',
            'link_url'      =>  '/su/create_settings',
            'form_url'      =>  '/su/event_wise_mail_composer_store',
            'link_title'    =>  'Compose'
        ];
        return view('superadmin.settings.email_composer', compact('page_details'));
    }
    public function eventWiseMailComposerStore(Request $request){
        //Define Rules
        $rules = [
            'event_id'              => 'required',
            'mail_body'       => 'required',
        ];

        // Create a new validator instance
        $validator = Validator::make($request->all(), $rules);
        if ($validator->fails()) {
            return redirect('su/event_wise_mail_composer')
                            ->withErrors($validator)
                            ->withInput()
                            ->with('error', 'Failed to save data');
        }
        $status     =   'success';
        $data       =   '';
        $message    =   'Data have been successfully saved';
        $allowedTags='<p><strong><em><u><h1><h2><h3><h4><h5><h6><img>';
        $allowedTags.='<li><ol><ul><span><div><br><ins><del>';
        $sContent = strip_tags(stripslashes($request->mail_body),$allowedTags);
        $whereParam     =   [
            'name'          =>  $request->event_id,
            'post_type'     =>  'email_text',
        ]; 
        $query          =   DB::table('settings')->select('values')->where($whereParam)->first();
        if(isset($query) && !empty($query)){
            DB::table('settings')
            ->where($whereParam)
            ->update(['values' => $sContent]);
        }else{
            $emailData      =   [
                'name'      =>  $request->event_id,
                'values'    =>  $sContent,
                'data_type' =>  'text',
                'post_type' =>  'email_text',
            ];
            DB::table('settings')->insert($emailData);  
        }
        
        return redirect('su/event_wise_mail_composer')
                            ->with('success', $message);
    }
    
    public function eventWisePdfComposer(){
        $page_details   =   [
            'page_title'    =>  'Pdf Design',
            'link_url'      =>  '/su/create_settings',
            'form_url'      =>  '/su/event_wise_pdf_composer_store',
            'link_title'    =>  'Compose'
        ];
        return view('superadmin.settings.pdf_composer', compact('page_details'));
    }
    public function eventWisePdfComposerStore(Request $request){
        //Define Rules
        $rules = [
            'event_id'        => 'required',
            'mail_body'       => 'required',
        ];

        // Create a new validator instance
        $validator = Validator::make($request->all(), $rules);
        if ($validator->fails()) {
            return redirect('su/event_wise_mail_composer')
                            ->withErrors($validator)
                            ->withInput()
                            ->with('error', 'Failed to save data');
        }
        $status     =   'success';
        $data       =   '';
        $message    =   'Data have been successfully saved';
        $allowedTags='<p><strong><em><u><h1><h2><h3><h4><h5><h6><img>';
        $allowedTags.='<li><ol><ul><span><div><br><ins><del>';
        $sContent = strip_tags(stripslashes($request->mail_body),$allowedTags);
        $whereParam     =   [
            'name'          =>  $request->event_id,
            'post_type'     =>  'pdf_text',
        ]; 
        $query          =   DB::table('settings')->select('values')->where($whereParam)->first();
        if(isset($query) && !empty($query)){
            DB::table('settings')
            ->where($whereParam)
            ->update(['values' => $sContent]);
        }else{
            $emailData      =   [
                'name'      =>  $request->event_id,
                'values'    =>  $sContent,
                'data_type' =>  'text',
                'post_type' =>  'pdf_text',
            ];
            DB::table('settings')->insert($emailData);  
        }
        
        return redirect('su/event_wise_pdf_composer')
                            ->with('success', $message);
    }
    
    public function getEmailText(Request $request){
        $status     =   'error';
        $data       =   '';
        $message    =   'Data not found';
        $whereParam     =   [
            'name'          =>  $request->event_id,
            'post_type'     =>  'email_text',
        ]; 
        $query = DB::table('settings')->select('values')->where($whereParam)->first();
        if(isset($query) && !empty($query)){
            $status     =   'success';
            $data       =   $query->values;
            $message    =   'Data found';
        }        
        $feedBack   =   [
            'status'    =>  $status,
            'data'      =>  $data,
            'message'   =>  $message,
        ];
        
        echo json_encode($feedBack);
    }
    public function getPdfText(Request $request){
        $status     =   'error';
        $data       =   '';
        $message    =   'Data not found';
        $whereParam     =   [
            'name'          =>  $request->event_id,
            'post_type'     =>  'pdf_text',
        ]; 
        $query = DB::table('settings')->select('values')->where($whereParam)->first();
        if(isset($query) && !empty($query)){
            $status     =   'success';
            $data       =   $query->values;
            $message    =   'Data found';
        }        
        $feedBack   =   [
            'status'    =>  $status,
            'data'      =>  $data,
            'message'   =>  $message,
        ];
        
        echo json_encode($feedBack);
    }
    
    public function test_pdf_text_check(Request $request){
        $first_name         =   'Tanveer';
        $last_name          =   'Qureshee';
        $event_title        =   'Test Event';
        $vars = array(
            '{$first_name}'         => 'Tanveer',
            '{$last_name}'          => 'Qureshee',
            '{$event_title}'        => 'Test Event'
          );
        $whereParam     =   [
            'name'          =>  12,//$request->event_id,
            'post_type'     =>  'pdf_text',
        ]; 
        $query = DB::table('settings')->select('values')->where($whereParam)->first();
        if(isset($query) && !empty($query)){
            $string         =   $query->values;
            echo strtr($string, $vars);;
            
        }
    }
}
