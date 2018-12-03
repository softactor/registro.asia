<?php

namespace App\Http\Controllers\Reports;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;

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
}
