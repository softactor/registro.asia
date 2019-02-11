<?php

namespace App\Http\Controllers\Reports;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Session;
use View;
use PDF;

class ReportsController extends Controller{
    
    public function index(){
        $page_details   =   [
            'page_title'    =>  'Reports'
        ];
        return view('superadmin.reports.dashboard', compact('page_details'));
    }
    
    public function get_reports(Request $request){
        $reportParam    =   [
            'report_type'   =>  $request->report_type
        ];
        $response   =   get_quick_report($reportParam);
        print "<pre>";
        print_r($response);
        print "</pre>";
        exit;
        
    }
    public function reports_custom_filter(Request $request){
        $page_details   =   [
            'page_title'    =>  'Reports'
        ];
        return view('superadmin.reports.report_custom_filter', compact('page_details'));
    }
    
    public function getCustomFilterReport(Request $request) {
        $all = $request->all();
        if ($request->generate_type == 'chart') {
            $seriesData =   [];            
            foreach (getFormIdByGroupby($request->event_id) as $form) {
                foreach (getFormLabelByFormId($form->form_id) as $fdata) {
                    //            $barColumnsArray = $request->dataBarColumn;
                    $label_name = $fdata->label_name;
                    $xData = [];
                    $yData = [];
                    $label_value_results = DB::table('event_registeration_form_values as u')
                            ->select('label_value')
                            ->where('event_id', $request->event_id)
                            ->where('label_name', $label_name)
                            ->groupBy('label_value')
                            ->get();
                    foreach ($label_value_results as $label_value) {
                        $label_value_count_results = DB::table('event_registeration_form_values as u')
                                ->select('id')
                                ->where('event_id', $request->event_id)
                                ->where('label_name', $label_name)
                                ->where('label_value', $label_value->label_value)
                                ->get();
                        $countLabelValues = count($label_value_count_results);
                        $xData[] = $label_value->label_value;
                        $yData[] = $countLabelValues;
                    } //end of label_value foreach
                    $seriesData[] = [
                        'name' => ucwords(str_replace('_', ' ', $label_name)),
                        'xdata' => $xData,
                        'ydata' => $yData,
                    ];
                } //end of label_name foreach 
            }
            $listDataView = View::make('partial.dynamic_form_bar_report', compact('seriesData'));
            $feedbackData   =   [
                'status'    => 'success',
                'message'   => 'Successfully updated',
                'data'      => $listDataView->render(),
                'chartData' => $seriesData
            ];
            echo json_encode($feedbackData);
        } else {
            $query = DB::table('event_business_owners_details');
            $columns = [];
            $columnsArray = $request->dataColumn;
            if (isset($columnsArray) && !empty($columnsArray)) {
                $query->select($columnsArray);
            }else{
                $query->select('salutation','first_name','last_name','company_name','company_address','gender','designation','mobile','country_id','tel','fax','email','serial_digit','namebadge_user_label');
            }

            if (isset($request->event_id) && !empty($request->event_id)) {
                $query->where('event_id', '=', $request->event_id);
            }
            if (isset($request->start_date) && !empty($request->start_date)) {
                $from_date = date('Y-m-d', strtotime($request->start_date)) . ' 00:00:00';
                $query->where('created_at', '>=', $from_date);
            }
            if (isset($request->end_date) && !empty($request->end_date)) {
                $to_date = date('Y-m-d', strtotime($request->end_date)) . ' 23:59:59';
                $query->where('created_at', '<=', $to_date);
            }
            // check query has row or not
            if ($query->get()) {
                $listData = $query->get()->toArray();
                $columnNamesData    =   $listData;
                $columnNames = array_keys((array) array_shift($columnNamesData));
                $listDataView = View::make('superadmin.reports.report_custom_filters_show_view', compact('listData', 'columnNames'));
                $feedbackData = [
                    'status' => 'success',
                    'message' => 'Successfully updated',
                    'data' => $listDataView->render()
                ];
                echo json_encode($feedbackData);
            }
        }
    }

    public function reports_grphic_view(Request $request){
        $page_details   =   [
            'page_title'    =>  'Reports'
        ];
        return view('superadmin.reports.graphic_chart_view', compact('page_details'));
    }
    
    public function getEventCustomForm(Request $request){
        $event_id       =   $request->event_id;
        $listDataView   =   View::make('partial.event_dynamic_form_fields', compact('event_id'));
        $feedbackData   =   [
            'status'    =>  'success',
            'message'   => 'Found data',
            'data'      => $listDataView->render()
        ];

        echo json_encode($feedbackData);
    }
    
    public function reports_pdf_download(Request $request){
        $param['html_data']  = $request->data;
        download_reports_pdf($param);
    }
    
    public function complete_reports(Request $request){
        $page_details   =   [
            'page_title'    =>  'Reports'
        ];
        return view('superadmin.reports.report_complete_view', compact('page_details'));
    }
    
    public function get_complete_report_pdf(Request $request) {
        $page_details   =   [
            'page_title'    =>  'Reports',
            'event_id'      =>  $request->event_id,
        ];
        $event_id   =   $request->event_id;
        $eventsData             = $this->get_report_event_data($event_id);
        $formData               = $this->get_report_event_form_data($event_id);
        $designationData      = $this->get_report_event_wise_designation_count($event_id);
        $countryData          = $this->get_report_country_wise_registraion_count($event_id);
        $reportDataDetails  =   [
            'eventData'             =>  $eventsData,
            'desigData'             =>  $designationData,
            'countryData'           =>  $countryData,
            'onsiteVisitorAnalysis' =>  $formData
        ];
        $eventData             =  $eventsData;
        $desigData           =  $designationData;
        $countryData         =  $countryData;
        $onsiteVisitorAnalysis =  $formData;
        $pdf = PDF::loadView('superadmin.reports.complete_report.complete_report_template', $reportDataDetails)
                ->stream('complete_report.pdf');
        return $pdf;
    }
    
    
    /*
     * *********************** Reports data processing start here **********************************
     */
    
    // get events data;
    public function get_report_event_data($event_id){
        $tableData     =   DB::table('events')
            ->where('id', $event_id)
            ->first();
        $listDataView   =   View::make('superadmin.reports.complete_report.event_template', compact('tableData'));
        return $listDataView->render();
    }
    // get events form data;
    public function get_report_event_form_data($event_id) {
        $formQuestionLevelsArray    =   [];
        $formQuestionTableArray     =   [];
        $tableData = DB::table('event_forms')
                ->where('event_id', $event_id)
                ->get();
        if (!$tableData->isEmpty()) {
            foreach($tableData as $data){
                // form level and its option name 
                $formFeilds     = json_decode($data->form_data);
                if(isset($formFeilds) && !empty($formFeilds)){
                    foreach($formFeilds as $flevelWithValues){
                        $optionValuesArray  =   [];
                        if(isset($flevelWithValues->values) && !empty($flevelWithValues->values)){
                            if(is_array($flevelWithValues->values)){
                                foreach($flevelWithValues->values as $optionValues){
                                    $optionValuesArray[]    =   [
                                        'optionValue'   =>  $optionValues->label,
                                        'counting'      =>  1,
                                        'parcentage'    =>  '1%',
                                    ];                                    
                                }
                            }else{
                              $optionValuesArray[]    =   [
                                    'optionValue'   =>  $flevelWithValues->values,
                                    'counting'      =>  1,
                                    'parcentage'    =>  '1%',
                                ];  
                            }
                        }                        
                        $formQuestionLevelsArray[]  =   $flevelWithValues->label; 
                        $formQuestionTableArray[]   =   [
                            'question_name'             =>  $flevelWithValues->label,
                            'question_answer_counting'  =>  $optionValuesArray,
                        ];
                    } // End of formfields
                }                
            }
        }
        $feedbackData   =   [
            'formQuestionLevelsArray'       => $formQuestionLevelsArray,
            'formQuestionTableArray'        => $formQuestionTableArray,
        ];
        if(isset($feedbackData) && !empty($feedbackData)){
            $listDataView   =   View::make('superadmin.reports.complete_report.onsite_visitor_analysis', compact('feedbackData'));
            return $listDataView->render();
        }
    }
    
    public function get_report_event_wise_designation_count($event_id){
        $tableData = DB::table('event_business_owners_details')
                    ->select(DB::raw('count(*) as desig_count, designation'))
                    ->where('event_id', $event_id)
                    ->groupBy('designation')->get();
        if(!$tableData->isEmpty()){
            $listDataView   =   View::make('superadmin.reports.complete_report.designation_wise_visitor_count_template', compact('tableData'));
            return $listDataView->render();
        }
    }
    public function get_report_country_wise_registraion_count($event_id){
        $countryRegistrationType        =   [];        
        $totalVisitorshipCount          =   0;        
        $onlineTotal                    =   0;        
        $onsiteTotal                    =   0;        
        $totalVisitorshipCount          =   0; 
        $localAttendee                  =   0; 
        $overSeasAttende                =   0; 
        
        $eventData = DB::table('events')
                    ->where('id', $event_id)
                    ->first();
        
        $tableData                  =   DB::table('event_business_owners_details as od')
            ->join('countries as c', 'c.id', '=', 'od.country_id')
            ->select('od.country_id', 'c.country_name')
            ->where('od.event_id', $event_id)
            ->groupBy('od.country_id')
            ->get();
        if(!$tableData->isEmpty()){
            foreach($tableData as $data){                
                if($data->country_id == $eventData->event_country){
                    $localAttendee++;
                }else{
                    $overSeasAttende++;
                }
                
                $onlineCount    =   0;
                $onsiteCount    =   0;
                $sumtotal       =   0;
                $countryRegistrationTypeTemp    =   [];
                $tableData2     =   DB::table('event_business_owners_details as ebod')
                    ->join('event_business_owners as ebo', 'ebo.id', '=', 'ebod.business_owner_id')
                    ->join('countries as c', 'c.id', '=', 'ebod.country_id')
                    ->select(DB::raw('c. country_name, count(ebo.registration_type) as online'))
                    ->where('ebod.country_id', $data->country_id)
                    ->where('ebo.registration_type', 'Online')
                    ->groupBy('registration_type')->first();
                if(isset($tableData2) && !empty($tableData2)){
                    $onlineCount    =   $tableData2->online;
                }
                $tableData3     =   DB::table('event_business_owners_details as ebod')
                    ->join('event_business_owners as ebo', 'ebo.id', '=', 'ebod.business_owner_id')
                    ->join('countries as c', 'c.id', '=', 'ebod.country_id')
                    ->select(DB::raw('c. country_name, count(ebo.registration_type) as onsite'))
                    ->where('ebod.country_id', $data->country_id)
                    ->where('ebo.registration_type', 'Onsite')
                    ->groupBy('registration_type')->first();
                if(isset($tableData3) && !empty($tableData3)){
                    $onsiteCount    =   $tableData3->onsite;
                }
                $sumtotal   =   ($onsiteCount + $onlineCount);
                $countryRegistrationTypeTemp    =   [
                    'country'   =>  $data->country_name,
                    'online'    =>  $onlineCount,
                    'onsite'    =>  $onsiteCount,
                    'total'     =>  $sumtotal
                ];
                $countryRegistrationType[]  =   $countryRegistrationTypeTemp;
                $totalVisitorshipCount      =   $totalVisitorshipCount + $sumtotal;
                $onlineTotal                =   $onlineTotal + $onlineCount;        
                $onsiteTotal                =   $onsiteTotal + $onsiteCount;
            }
            $countryRegistrationTypeTemp    =   [
                'country'   =>  'Total Visitorship',
                'online'    =>  $onlineTotal,
                'onsite'    =>  $onsiteTotal,
                'total'     =>  $totalVisitorshipCount
            ];
            $countryRegistrationType[]  =   $countryRegistrationTypeTemp;
        }
        $overSeasData = [
            [
                'title'         => 'Local Attendees',
                'local_attende' => $localAttendee,
                'overseas'      => '%',
            ],
            [
                'title'         => 'Overseas Attendees',
                'local_attende' => $overSeasAttende,
                'overseas'      => '%',
            ],
        ];
        
        $feedbackData   =   [
            'countries_data'    => $countryRegistrationType,
            'countries_ratio'   => $overSeasData,
        ];
        if(isset($feedbackData) && !empty($feedbackData)){
            $listDataView   =   View::make('superadmin.reports.complete_report.country_wise_attendees_template', compact('feedbackData'));
            return $listDataView->render();
        }
    }

    public function quick_reports_view(){
        $page_details           =   [
            'page_title'        =>  'Quick Report',
            'quickReporturl'    =>  url('su/get_quick_reports_data'),
        ];
        return view('superadmin.reports.report_quick_view', compact('page_details'));
    }
    
    public function get_quick_reports_data(Request $request){ 
        $feedback   =   '';
        $attended   =   0;
        $import     =   0;
        $online     =   0;
        $onsite     =   0;
        // get total online registration:
        $attendedUsers = DB::table('event_business_owners_details as d')
            ->join('namebadge_print_status as s', 'd.id', '=', 's.namebadge_id')
            ->select('d.id as attended')
            ->where('d.event_id', $request->event_id)
            ->groupBy('s.namebadge_id')
            ->get();
        if(!$attendedUsers->isEmpty()){
            $attended  =  count($attendedUsers);
        }
        
        $onlineUsers = DB::table('event_business_owners')
            ->where('event_id', $request->event_id)
            ->where('registration_type', 'Online')
            ->sum('owners_numbers');
        if($onlineUsers){
            $online     =   $onlineUsers;
        }
        $onsiteUsers = DB::table('event_business_owners')
            ->where('event_id', $request->event_id)
            ->where('registration_type', 'Onsite')
            ->sum('owners_numbers');
        if($onsiteUsers){
            $onsite     =   $onsiteUsers;
        }
        $importUsers = DB::table('event_business_owners')
            ->where('event_id', $request->event_id)
            ->where('registration_type', 'Import')
            ->sum('owners_numbers');
        if($importUsers){
            $import     =   $importUsers;
        }
        
        $staticsData  =    [
            'attended'      => $attended,
            'online'        => $online,
            'onsite'        => $onsite,
            'import'        => $import,
            'sum_of_all'    => $import+$onsite+$online
        ];
        
        $listDataView   =   View::make('partial.quick_report_table_view', compact('staticsData'));
        $feedbackData   =   [
            'status'    =>  'success',
            'message'   => 'Found data',
            'data'      => $listDataView->render()
        ];

        echo json_encode($feedbackData);
        
    }

}
