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
            'page_title'            =>  "Namebadge Configuration",
            'events'                =>  $events,
            'form_url'              =>  'su/name_badge_config_store',
            'previous_config_url'   =>  'su/name_badge_background_by_event',
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
        $events     = DB::table('events')->where('id', $request->event_id)->first();
        $path       = $_FILES['background']['name'];
        $dimention_path       = $_FILES['background']['tmp_name'];
        $imageDimention     =   getimagesize($dimention_path);
        if($imageDimention['0'] > 550){
            return redirect('su/name_badge_config')
                            ->withInput()
                            ->with('error', 'Failed to save data.Background template maximum allowed width was 550');
        }
        
        $ext        = pathinfo($path, PATHINFO_EXTENSION);
        $filename   = implode('_', explode(' ', $events->title)) .time(). "." . $ext;
        $filepath   = public_path('/namebadge/');
        /* ----------------------------------------------------------
         * check duplicate entry
         * ---------------------------------------------------------
         */
        $checkParam['table'] = "name_badge_config";
        $checkWhereParam = [
            ['event_id', '=', $request->event_id]
        ];
        $checkParam['where']    = $checkWhereParam;
        $duplicateCheck_id      = check_duplicate_data($checkParam); //check_duplicate_data is a helper method:
        // check is it duplicate or not
        if ($duplicateCheck_id) {
            $name_badge_configure = NamebadgeConfigModel::find($duplicateCheck_id);
            $file_path = public_path('/namebadge/'.$name_badge_configure->image_path);
            unlink($file_path);
            $response   =   $name_badge_configure->update([
                'event_id'              => $request->event_id,
                'namebadge_width'       => $request->namebadge_width,
                'namebadge_height'      => $request->namebadge_height,
                'namebadge_orientation' => $request->namebadge_orientation,
                'image_path'            => $filename,
                'measure_unit'          => $request->measure_unit,
            ]);            
            $op_message =   'data have successfully updated';
        } else {
            /* ----------------------------------------------------------
             * Insert area
             * ---------------------------------------------------------
             */
            $response = NamebadgeConfigModel::create([
                        'event_id' => $request->event_id,
                        'namebadge_width' => $request->namebadge_width,
                        'namebadge_height' => $request->namebadge_height,
                        'namebadge_orientation' => $request->namebadge_orientation,
                        'image_path' => $filename,
                        'measure_unit' => $request->measure_unit,
            ]);
            $op_message =   'data have successfully saved';
        }
        $checkMove = move_uploaded_file($_FILES['background']['tmp_name'], $filepath . $filename);
        if ($response) {
            return redirect('su/name_badge_config')
                            ->with('success', $op_message);
        } else {
            return redirect('su/name_badge_config')
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
        $name_badge_position            =   [];
        $positionEditViewRender         =   [];
        $name_badge_position_status     =   false;
        $templates = NamebadgeConfigModel::where('event_id', $request->event_id)->first();
        // check name_badge_position table have already saved position for this event
        $position_details   =   DB::table('name_badge_position')->where('event_id',$request->event_id)->get();
        if (!$position_details->isEmpty()) { 
            foreach($position_details as $pd){
                $name_badge_position[$pd->field_id]   =   $pd;
            } 
            $positionEditView    = View::make('partial.name_badge_position_edit_view', compact('position_details'));
            $name_badge_position_status     =   TRUE;
            $positionEditViewRender         =   $positionEditView->render();
        }
        if (isset($templates) && !empty($templates)) {
            $feedback = [
                'status'                        => 'success',
                'name_badge_position_status'    => $name_badge_position_status,
                'name_badge_position'           => $name_badge_position,
                'positionEditView'              => $positionEditViewRender,
                'data'                          => $templates,
                'bg_template_url'               => asset('/namebadge/'.$templates->image_path),
                'message'                       => 'Data found',
            ];
            echo json_encode($feedback);
        } else {
            $feedback = [
                'status' => 'error',
                'data' => '',
                'name_badge_position_status'    => $name_badge_position_status,
                'name_badge_position'           => $name_badge_position,
                'message' => 'Did not found any events template!',
            ];
            echo json_encode($feedback);
        }
    }
    public function name_badge_set_position_store(Request $request) {
        $all = json_decode($request->dataParam);
        if (isset($all) && !empty($all)) {
            if (isset($request->event_id) && !empty($request->event_id)) {
//                $deleteParam = [
//                    'name_badge_id' => $request->name_badge_id,
//                    'event_id' => $request->event_id,
//                ];
//                DB::table('name_badge_position')->where($deleteParam)->delete();
                foreach ($all as $dataval) {
                    /* ----------------------------------------------------------
                     * check duplicate entry
                     * ---------------------------------------------------------
                     */
                    $checkParam['table'] = "name_badge_position";
                    $checkWhereParam = [
                        ['event_id', '=', $dataval->event_id],
                        ['field_id', '=', $dataval->field_id]
                    ];
                    $checkParam['where'] = $checkWhereParam;
                    $duplicateCheck_id = check_duplicate_data($checkParam); //check_duplicate_data is a helper method:
                    // check is it duplicate or not
                    if ($duplicateCheck_id) {
                        $name_badge_configure = NamebadgePositionModel::find($duplicateCheck_id);
                        $response = $name_badge_configure->update([
                            'name_badge_id'         => $dataval->name_badge_id,
                            'event_id'              => $dataval->event_id,
                            'field_id'              => $dataval->field_id,
                            'left_value'            => $dataval->newleft,
                            'top_value'             => $dataval->newtop,
                            'left_absulate_value'   => $dataval->left_absulate_value,
                            'top_absulate_value'    => $dataval->top_absulate_value,
                        ]);
                    } else {
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
                                    'left_absulate_value' => $dataval->left_absulate_value,
                                    'top_absulate_value' => $dataval->top_absulate_value,
                        ]);
                    }// end of foreach
                }
                $feedback = [
                    'status' => 'success',
                    'message' => 'data have successfully updated',
                    'data' => $all
                ];
                echo json_encode($feedback);
            } else {
                $feedback = [
                    'status' => 'error',
                    'message' => 'Event was not selected',
                    'data' => ''
                ];
                echo json_encode($feedback);
            }
        } else {
            $feedback = [
                'status' => 'error',
                'message' => 'Label was not selected',
                'data' => ''
            ];
            echo json_encode($feedback);
        }
    }
    
    public function name_badge_field_delete(Request $request) {
        $deleteParam = [
            'id' => $request->del_id
        ];
        DB::table('name_badge_position')->where($deleteParam)->delete();
        $feedback = [
                'status' => 'success',
                'message' => 'Data have successfully deleted',
                'data' => ''
            ];
            echo json_encode($feedback);
    }

}
