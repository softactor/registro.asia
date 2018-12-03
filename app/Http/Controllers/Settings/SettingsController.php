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
        $name       =   $request->name;
        $getAllData =   DB::table('settings')->where('name','namebadge label')->first(); 
        if(isset($getAllData) && !empty($getAllData)){
            $valuesArray    = explode(',', $getAllData->values);
            if(!in_array($name, $valuesArray)){
                array_push($valuesArray,$name);
                $udateValues    = implode(',', $valuesArray);
                DB::table('settings')
                ->where('id', $getAllData->id)
                ->update(['values' => $udateValues]);
            }
            $getAllData         =   DB::table('settings')->where('name','namebadge label')->first();
            $listData           =   explode(',', $getAllData->values);
            $listDataView       =   View::make('partial.settings_name_badge_values_list', compact('listData'));
            $feedbackData   =   [
                'status'    =>  'success',
                'message'   => 'Successfully updated',
                'data'      => $listDataView->render()
            ];
        }
        echo json_encode($feedbackData);
    }
    
    public function deleteNamebadgeValues(Request $request) {
        $name       = $request->name;
        $getAllData = DB::table('settings')->where('name', 'namebadge label')->first();
        if (isset($getAllData) && !empty($getAllData)) {
            $valuesArray = explode(',', $getAllData->values);
            if (($key = array_search($name, $valuesArray)) !== false) {
                unset($valuesArray[$key]);
                $udateValues    = implode(',', $valuesArray);
                DB::table('settings')
                ->where('id', $getAllData->id)
                ->update(['values' => $udateValues]);
            }
        }
        $feedbackData   =   [
            'status'    =>  'success',
            'message'   => 'Successfully Deleted'
        ];
        echo json_encode($feedbackData);
    }

}
