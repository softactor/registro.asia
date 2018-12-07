<?php

namespace App\Http\Controllers\Reports;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Session;
use View;

class ChartController extends Controller{
    
    /*
      |==========================================================================
      |generel table query method
      |@author   :   Tanveer Qureshee
      |@data     :   15-03-2018
      |@param    :   conditional param with tablename, where condition;
      |@output   :   Return Resource Data and json data (depending on param)
      |==========================================================================
     */

    public function get_table_data(Request $request) {
        $param = json_decode($request->param);
        // assign default data value:

        $status = "error";
        $message = "Data Not Found";
        $query_data = "";
        $x_axis = "";

        // if need coma separated value:
        if ($request->csv == true) {
            $query_data = getNameCountFromCSV('org_quest_survey', $request->cmp_field, 2100, 'ID', $param);            
            $feedback_data = [
                'status'        => "success",
                'result'        => $query_data['result'],
                'x_axis'        => $query_data['x_data'],
                'y_axis'        => $query_data['y_data'],
                'denominator'   => $query_data['denominator'],
                'message'       => $message
            ];

            // check how to return:
            if ($param->return_type == 'json') {
                echo json_encode($feedback_data);
            } else {
                return $feedback_data;
            }
        } else {
            $query = DB::table($param->table);
                    

            // check query has where condition:
            if (isset($param->null_check_field_with_value) && !empty($param->null_check_field_with_value)) {
                $query->select(DB::raw('(CASE ' . $param->null_check_field_with_value . ' = null THEN' . $param->null_replace_value . 'ELSE ' . $param->null_check_field_with_value . ' END) AS name', 'count(*) y'));
            } else {
                $query->select($param->fields_name, DB::raw('count(*) y'));
            }
            if (isset($param->where) && !empty($param->where)) {
                $query->where($param->where);
            }
            if (isset($param->null_check_field) && !empty($param->null_check_field)) {
                $query->where($param->null_check_field, "!=", null);
            }

            if (isset($request->location_type) && !empty($request->location_type)) {
                $query->where('LOCATION_TYPE', '=', $request->location_type);
            }

            if (isset($request->gender) && !empty($request->gender)) {
                $query->where('Q4', '=', $request->gender);
            }

            if (isset($param->district_id) && !empty($param->district_id)) {
                $query->where('DISTRICT', '=', $param->district_id);
            }
            if (isset($param->up_id) && !empty($param->up_id)) {
                $query->where('Sub_District', '=', $param->up_id);
            }

            if (isset($request->business_type) && !empty($request->business_type)) {
                $query->where('type_of_business', '=', $request->business_type);
            }
            
            if (isset($param->orderBy) && !empty($param->orderBy)) {
                $query->orderBy($param->orderBy, 'desc');
            }else{
                $query->orderBy('y', 'desc');
            }

            if (isset($request->generation) && !empty($request->generation)) {
                $gr_query = DB::table('generation_types')
                        ->select('*')
                        ->where('id', '=', $request->generation)
                        ->first();
                $age_range = explode("-", $gr_query->age_range);

                $age_from = $age_range[0];
                $age_to = $age_range[1];

                $query->where('Q3', '>=', $age_from);
                $query->where('Q3', '<=', $age_to);
            }

            // check query has groupby:
            if (isset($param->groupBy) && !empty($param->groupBy)) {
                $query->groupBy($param->groupBy);
            }

            // check query has row or not
            if ($query->get()) {
                $query_data = $query->get();
                $status = "success";
                $message = "Data Found";
                
                // check x_axis data param
                if (isset($param->x_axis) && !empty($param->x_axis)) {
                    $x_axis = $query_data->pluck($param->x_axis);
                }

                //Percentage Calculation
                //$percent_calc = [];
                $percent_calc = $query_data->pluck('y')->toArray();
                $result = [];
                if(isset($param->denominator) && $param->denominator==true){
                    $denominator    =   array_sum($percent_calc);
                }else{
                    $denominator    =   2100;
                }
                
                foreach ($percent_calc as $val) {
                    $chengeVal = (($val * 100) / $denominator);
                    array_push($result, (float) number_format($chengeVal, 2, '.', ''));
                }
                $feedback_data = [
                    'status'        => $status,
                    'result'        => $query_data,
                    'x_axis'        => $x_axis,
                    'y_axis'        => $result,
                    'denominator'   => $denominator,
                    'message'       => $message
                ]; 
//                if($param->groupBy == "Q5"){
//                    print "<pre>";
//                    print_r($result);
//                    print "</pre>";
//                    exit;
//                    
//                }
            }else{
                $feedback_data = [
                    'status' => 'error',
                    'result' => "",
                    'x_axis' => "",
                    'y_axis' => "",
                    'message' => "No Data Found."
                ];
            }
            // check how to return:
            if ($param->return_type == 'json') {
                echo json_encode($feedback_data);
            } else {
                return $feedback_data;
            }
        }
    }

    /*
     * +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
     * Method is using to draw pivot chart table
     * @author      : Tanveer Qureshee
     * @date        : 22-04-2018  
     * @data        : check if the return need outbound result or not. Default value is False  
     * For Showing Pivot Chart data the table fields are: Q5,Q6,Q7,Q10,Q8,Q9
     * +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
     */

    public function get_general_pivot_data(Request $request) {
        $param = json_decode($request->dataParam);
        $db_query = DB::table("org_quest_survey as oqs")->select(DB::raw($param->sql))
                    ->join('location_types as loc', 'loc.id', '=', 'oqs.LOCATION_TYPE')
                    ->join('genders as g', 'g.id', '=', 'oqs.Q4')
                    ->join('location_bbs2011 as lbb', 'lbb.district', '=', 'oqs.DISTRICT')
                    ->where('lbb.loc_type', '=', 'DT')
                ->get();
        $pivotData = array();
        foreach ($db_query as $key => $val) {
            $lockal_key_generate = [];
            foreach ($param->arrayKyes as $arrayKeys) {
                $lockal_key_generate[$arrayKeys] = $val->$arrayKeys;
            }
            $pivotData[$key] = $lockal_key_generate;
        }
        echo $pivotData = json_encode($pivotData);
    }

    /*
     * +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
     * Method is using to draw tree map chart
     * @author      : Tanveer Qureshee
     * @date        : 05-05-2018  
     * @data        : check if the return need outbound result or not. Default value is False  
     * For Showing tree map chart data the table fields are: Q38,Q39
     * +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
     */

    public function get_tree_chart_data(Request $request) {
        $total_row_count = 0;
        $param = json_decode($request->param);
        $query = DB::table('org_quest_survey as oqs')
                ->select("oqs.DISTRICT", "oqs.Sub_District", "oqs.$param->field1", "oqs.$param->field2");

        if (isset($param->district_id) && !empty($param->district_id)) {
            $query->where('oqs.DISTRICT', '=', $param->district_id);
        }
        if (isset($param->up_id) && !empty($param->up_id)) {
            $query->where('oqs.Sub_District', '=', $param->up_id);
        }


        $leagues = $query->get();
        $total_row_count = count($leagues);

        // variable initialization:

        $category_container = [];
        $category_value_container = [];
        $noCount = 0;
        foreach ($leagues as $l) {
            if ($l->{$param->field1} == "Yes") {
                if (!in_array($l->{$param->field2}, $category_container)) {
                    $category_container[] = $l->{$param->field2};
                    $item_key = array_search($l->{$param->field2}, $category_container);
                    $category_value_container[$item_key] = [
                        'cat_name' => $l->{$param->field2},
                        'cat_value' => 1
                    ];
                } else {
                    $item_key = array_search($l->{$param->field2}, $category_container);
                    $category_value_container[$item_key]['cat_value'] ++;
                }// end of else
            } else {
                $noCount++;
            }// end of yes check
        }// end of foreach      
        $modified_array_no["No"] = "$noCount";
        $modified_array = [];

        foreach ($category_value_container as $v) {
            $catName = $v['cat_name'];
            $catvalue = $v['cat_value'];
            $modified_array[$catName] = "$catvalue";
        }
        $feedBackData = [
            'total_row_count' => $total_row_count,
            'Yes' => $modified_array,
            'No' => $modified_array_no
        ];
        echo json_encode($feedBackData);
    }
    
    public function get_events_chart_data(Request $request){
        $param = json_decode($request->param);
        $result    =   $this->pull_events_data($param); 
        $feedbackData   =   [
            'status'    =>  'success',
            'message'   =>  'Data found',
            'result'   =>  $result,
        ];
        echo json_encode($feedbackData);
    }
    
    public function pull_events_data($param){
        switch($param->dataType){
            case 'yearly_events':
                $query = DB::table('events as ev');
                if (isset($param->startDate) && !empty($param->startDate)) {
                    $from_date      =   date("Y-m-d", strtotime($param->startDate));
                    $query->where('ev.start_date', '>=', $from_date);
                }            
                if (isset($param->endDate) && !empty($param->endDate)) {
                    $to_date      =   date("Y-m-d", strtotime($param->endDate));
                    $query->where('ev.end_date', '<=', $to_date);
                }
                if (isset($param->event_id) && !empty($param->event_id)) {
                    $query->where('ev.id', '=', $param->event_id);
                }
                $list_data = $query->get();
                if(!$list_data->isEmpty()){
                    $dataArray  =   [];
                    foreach ($list_data as $data) {
                        $totalAttendee  =   0;
                        $query = DB::table('event_business_owners_details as ebd')
                                ->where('ebd.event_id', $data->id)
                                ->where('ebd.is_confirmed', 1);
                        if ($query->get()) {
                            $query_data     = $query->get();
                            $totalAttendee  =   count($query_data);
                        }
                        $dataValue  =   [
                            'name'  =>  $data->title,
                            'y'     =>  $totalAttendee
                        ];
                        $dataArray[]    =   $dataValue;
                    }// end of foreach
                }// end of emty checking
                break;
            case 'yearly_events_reg_type':
                $query = DB::table('events as ev');
                if (isset($param->startDate) && !empty($param->startDate)) {
                    $from_date      =   date("Y-m-d", strtotime($param->startDate));
                    $query->where('ev.start_date', '>=', $from_date);
                }            
                if (isset($param->endDate) && !empty($param->endDate)) {
                    $to_date      =   date("Y-m-d", strtotime($param->endDate));
                    $query->where('ev.end_date', '<=', $to_date);
                }
                if (isset($param->event_id) && !empty($param->event_id)) {
                    $query->where('ev.id', '=', $param->event_id);
                }
                $list_data = $query->get();
                if(!$list_data->isEmpty()){
                    $ids = $list_data->pluck('id')->toArray();
                    $dataArray      =   [];
                    $totalAttendee  =   0;
                    $query          = DB::table('event_business_owners as ebd')
                            ->select(DB::raw("SUM(owners_numbers) as owners_numbers, registration_type"))
                            ->whereIn('ebd.event_id', $ids)
                            ->groupBy('ebd.registration_type');
                    if ($query->get()) {
                        $query_data = $query->get();
                        //$regT
                        foreach ($query_data as $t) {
                            $dataValue = [
                                'name'  => $t->registration_type,
                                'y'     => (int)$t->owners_numbers
                            ];
                            $dataArray[]    =   $dataValue;
                        } // END FOR FOREACH
                    }
                    
                }// end of emty checking
                break;
            default:
                break;
        }// end of switch case:
        return $dataArray;
    }
}
