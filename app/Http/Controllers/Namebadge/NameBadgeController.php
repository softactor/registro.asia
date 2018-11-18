<?php

namespace App\Http\Controllers\Namebadge;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Model\Namebadge\NamebadgeConfigModel;
use App\Model\Namebadge\NamebadgePositionModel;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Session;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Facades\Auth;
use View;

class NameBadgeController extends Controller{
    
    public function name_badge_config(Request $request){
        $events        =   DB::table('events')->get();
        $page_details   =   [
            'page_title'    =>  "Namebadge Configuration",
            'events'        =>  $events,
            'form_url'      =>  'su/name_badge_config_store',
        ];
        return view('superadmin.namebadge.config', compact('page_details'));
    }
    public function name_badge_config_store(Request $request) {
        //Define Rules
        $rules = [
            'event_id'              => 'required',
            'namebadge_width'       => 'required',
            'namebadge_height'      => 'required',
            'namebadge_orientation' => 'required',
            'measure_unit'          => 'required',
            'background'            => 'required',
        ];

        // Create a new validator instance
        $validator = Validator::make($request->all(), $rules);
        if ($validator->fails()) {
            return redirect('su/name_badge_config')
                            ->withErrors($validator)
                            ->withInput()
                            ->with('error', 'Failed to save data');
        }
        /*----------------------------------------------------------
         *check duplicate entry
         * ---------------------------------------------------------
         */
        $checkParam['table']    = "name_badge_config";
        $checkWhereParam = [
                ['event_id',      '=', $request->upz_id]
        ];
        $checkParam['where']    = $checkWhereParam;
        $duplicateCheck         = check_duplicate_data($checkParam); //check_duplicate_data is a helper method:
        // check is it duplicate or not
        if ($duplicateCheck) {
            return redirect('admin/area/create')
                            ->withInput()
                            ->with('error', 'Failed to save data. Duplicate Entry found.');
        }// end of duplicate checking:
        
        
        $events        =   DB::table('events')->where('id', $request->event_id)->first();
        $path = $_FILES['background']['name'];
        $ext = pathinfo($path, PATHINFO_EXTENSION);
        $filename = implode('_',explode(' ',$events->title)) . "." . $ext;
        $filepath = public_path('/namebadge/');
        /*----------------------------------------------------------
         *Insert area
         * ---------------------------------------------------------
         */
        $response   =   NamebadgeConfigModel::create([
            'event_id'                  =>  $request->event_id,
            'namebadge_width'           =>  $request->namebadge_width,
            'namebadge_height'          =>  $request->namebadge_height,
            'namebadge_orientation'     =>  $request->namebadge_orientation,
            'image_path'                =>  $filename,
            'measure_unit'              =>  $request->measure_unit,
        ]);
        $checkMove = move_uploaded_file($_FILES['background']['tmp_name'], $filepath . $filename);
        if($response){
            return redirect('su/name_badge_config')
                            ->with('success', 'Data have been saved successfully.');
        }else{
            return redirect('admin/area/create')
                            ->withInput()
                            ->with('error', 'Failed to save data.');
        }
    }
    public function name_badge_set_position(Request $request){
        $page_details   =   [
            'page_title'                =>  'Badge Design',
            'background_image_path'     =>  asset('namebadge/'),
            'get_background_url'        =>  'su/name_badge_background_by_event',
            'position_store'            =>  'su/name_badge_set_position_store',
        ];
        return view('superadmin.namebadge.name_badge_set_position', compact('page_details'));   
    }
    public function name_badge_background_by_event(Request $request) {
        $templates = NamebadgeConfigModel::where('event_id', $request->event_id)->first();
        if (isset($templates) && !empty($templates)) {
            $feedback = [
                'status' => 'success',
                'data' => $templates,
                'message' => 'Data found',
            ];
            echo json_encode($feedback);
        } else {
            $feedback = [
                'status' => 'error',
                'data' => '',
                'message' => 'Did not found any events template!',
            ];
            echo json_encode($feedback);
        }
    }

    public function name_badge_set_position_store(Request $request) {
        $all = json_decode($request->dataParam);
        if (isset($all) && !empty($all)) {
            if (isset($request->event_id) && !empty($request->event_id)) {
                $deleteParam = [
                    'name_badge_id' => $request->name_badge_id,
                    'event_id' => $request->event_id,
                ];
                DB::table('name_badge_position')->where($deleteParam)->delete();
                foreach ($all as $dataval) {
                    /* ----------------------------------------------------------
                     * Insert area
                     * ---------------------------------------------------------
                     */
                    $response = NamebadgePositionModel::create([
                                'name_badge_id' => $dataval->name_badge_id,
                                'event_id' => $dataval->event_id,
                                'field_id' => $dataval->field_id,
                                'left_value' => $dataval->newleft,
                                'top_value' => $dataval->newtop,
                    ]);
                }// end of foreach
                $feedback = [
                    'status'    => 'success',
                    'message'   => 'data have successfully updated',
                    'data'      => $all
                ];
                echo json_encode($feedback);
            }else{
               $feedback   =   [
                'status'    => 'error',
                'message'   => 'Event was not selected',
                'data'      =>''
            ];
            echo json_encode($feedback); 
            }
        }else{
            $feedback   =   [
                'status'    => 'error',
                'message'   => 'Label was not selected',
                'data'      =>''
            ];
            echo json_encode($feedback);
        }
    }

}
