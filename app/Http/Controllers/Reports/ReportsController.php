<?php

namespace App\Http\Controllers\Reports;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Session;
use View;

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
    
    public function getCustomFilterReport(Request $request){
        $query      = DB::table('event_business_owners_details');
        $columns            =   [];
        $columnsArray       =   $request->dataColumn;
        if(isset($columnsArray) && !empty($columnsArray)){
            $query->select($columnsArray);
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
            $listData           =   $query->get()->toArray();            
            $columnNames        =   array_keys((array)array_shift($listData));
            $listDataView   =   View::make('superadmin.reports.report_custom_filters_show_view', compact('listData','columnNames'));
            $feedbackData   =   [
                'status'    =>  'success',
                'message'   => 'Successfully updated',
                'data'      => $listDataView->render()
            ];
            
            echo json_encode($feedbackData);
        }        
    }
    
    public function reports_grphic_view(Request $request){
        $page_details   =   [
            'page_title'    =>  'Reports'
        ];
        return view('superadmin.reports.graphic_chart_view', compact('page_details'));
    }
}
