<?php

namespace App\Http\Controllers\Settings;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;

class SettingsController extends Controller{
    public function index(){
        $page_details   =   [
            'page_title'    =>  'Settings',
            'link_url'      =>  '/su/create_settings',
            'link_title'    =>  'Create'
        ];
        return view('superadmin.settings.list', compact('page_details'));
    }
}
