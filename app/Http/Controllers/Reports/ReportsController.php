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
}
