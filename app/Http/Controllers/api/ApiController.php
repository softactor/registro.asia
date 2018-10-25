<?php

namespace App\Http\Controllers\api;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use View;

class ApiController extends Controller
{
    public function index() {
        $registration_form    = View::make('api.index');
        $feedback_data  = [
            'status'    => 'success',
            'message'   => 'Data Found',
            'data'      => $registration_form->render()
        ];
        return $feedback_data;
    }
    public function index_test() {
        return view('api.index');
    }
}
