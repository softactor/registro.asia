<?php

namespace App\Http\Controllers\Namebadge;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Model\Namebadge\NamebadgeConfigModel;
use App\Model\Namebadge\NamebadgePositionModel;
use App\Model\Namebadge\NamebadgeTemplateDetailsModel;
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
        
        // count_template_name
        $template_image_upload_details  =   [
            'templates_name'    =>  $request->template_name,
            'templates'         =>  $_FILES['background']
        ];
        $template_upload_response    =   $this->upload_multiple_template_images($template_image_upload_details);        
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
            $response   =   $name_badge_configure->update([
                'event_id'              => $request->event_id,
                'namebadge_width'       => $request->namebadge_width,
                'namebadge_height'      => $request->namebadge_height,
                'namebadge_orientation' => $request->namebadge_orientation,
                'image_path'            => '',
                'measure_unit'          => $request->measure_unit,
            ]);            
            $op_message =   'data have successfully updated';
            if(isset($template_upload_response) && !empty($template_upload_response)){
                $template_details_param  =   [
                    'config_id'         =>  $duplicateCheck_id,
                    'template_details'  =>  $template_upload_response,
                ];
                
                $store_response   =  $this->store_namebadge_template_details($template_details_param);
            }
        } else {
            /* ----------------------------------------------------------
             * Insert area
             * ---------------------------------------------------------
             */
            if (isset($template_upload_response) && !empty($template_upload_response)) {
                $response = NamebadgeConfigModel::create([
                            'event_id' => $request->event_id,
                            'namebadge_width' => $request->namebadge_width,
                            'namebadge_height' => $request->namebadge_height,
                            'namebadge_orientation' => $request->namebadge_orientation,
                            'image_path' => '',
                            'measure_unit' => $request->measure_unit,
                ])->id;
                $op_message = 'data have successfully saved';
                if(isset($template_upload_response) && !empty($template_upload_response)){
                $template_details_param  =   [
                    'config_id'         =>  $response,
                    'template_details'  =>  $template_upload_response,
                ];
                
                $store_response   =  $this->store_namebadge_template_details($template_details_param);
            }
            }else{
                return redirect('su/name_badge_config')
                            ->withInput()
                            ->with('error', 'No template file was selected!');
            }
        }
        if ($response) {
            return redirect('su/name_badge_config')
                            ->with('success', $op_message);
        } else {
            return redirect('su/name_badge_config')
                            ->withInput()
                            ->with('error', 'Failed to save data.');
        }
    }
    
    public function upload_multiple_template_images($imageData) {
        $uploaded_details = [];
        $total_tamplate_image = count($imageData['templates_name']);
        for ($i = 0; $i < $total_tamplate_image; $i++) {
            if (isset($imageData['templates_name'][$i]) && $imageData['templates']['tmp_name'][$i]) {
                $path = $imageData['templates']['name'][$i];
                $dimention_path = $imageData['templates']['tmp_name'][$i];
                $imageDimention = getimagesize($dimention_path);
                if ($imageDimention['0'] > 550) {
                    
                }

                $ext = pathinfo($path, PATHINFO_EXTENSION);
                $filename = date('m-d-Y') . '_' . 'name_badge_template_' . $i . '_' . time() . "." . $ext;
                $filepath = public_path('/namebadge/');
                $checkMove = move_uploaded_file($imageData['templates']['tmp_name'][$i], $filepath . $filename);
                $uploaded_details[] = [
                    'template_name' => $imageData['templates_name'][$i],
                    'template_file_name' => $filename
                ];
            }
        }

        return $uploaded_details;
    }
    
    public function store_namebadge_template_details($template_details_param) {
        foreach($template_details_param['template_details'] as $template_details) {
            $response = NamebadgeTemplateDetailsModel::create([
                        'config_id'     => $template_details_param['config_id'],
                        'template_name' => $template_details['template_name'],
                        'image_path'    => $template_details['template_file_name']
                    ])->id;
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
    
    public function saveNamebadgeFontStyle(Request $request) {
        $font_style = [];
        $font_unit = '';
        $font_size = '';
        $font_weight = '';
        $is_up_status = false;
        if (isset($request->font_unit) && !empty($request->font_unit)) {
            $font_unit = $request->font_unit;
            $is_up_status = true;
        }
        if (isset($request->font_size) && !empty($request->font_size)) {
            $font_size = $request->font_size;
            $is_up_status = true;
        }
        if (isset($request->font_weight) && !empty($request->font_weight)) {
            $font_weight = $request->font_weight;
            $is_up_status = true;
        }
        if ($is_up_status) {
            $name_badge_configure = NamebadgePositionModel::find($request->nameBadgeFieldsId);
            $db_fontstyle = json_decode($name_badge_configure->font_style);
            if (isset($db_fontstyle) && !empty($db_fontstyle)) {
                $font_style = [
                    'font_unit' => (isset($font_unit) && !empty($font_unit) ? $font_unit : $db_fontstyle->font_unit),
                    'font_size' => (isset($font_size) && !empty($font_size) ? $font_size : $db_fontstyle->font_size),
                    'font_weight' => (isset($font_weight) && !empty($font_weight) ? $font_weight : $db_fontstyle->font_weight),
                ];
            } else {
                $font_style = [
                    'font_unit' => $font_unit,
                    'font_size' => $font_size,
                    'font_weight' => $font_weight,
                ];
            }

            $response = $name_badge_configure->update([
                'font_style' => json_encode($font_style)
            ]);
            $feedback   =   [
                'status'    => 'success',
                'message'   => 'Data have successfully updated',
                'data'      => $font_style,
            ];
        }else{
            $feedback   =   [
                'status'    => 'error',
                'message'   => 'Nothing to Update',
                'data'      => $font_style,
            ];
        }
        
        echo json_encode($feedback);
    }

}
