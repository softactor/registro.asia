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
//        $printData['event_id']  =   $request->event_id;
//        $pdf = PDF::loadView('superadmin.reports.dynamic_form_bar_report', $printData)
//                ->stream('complete_report.pdf');
//        return $pdf;
        return view('superadmin.reports.dynamic_form_bar_report', compact('event_id'));
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
