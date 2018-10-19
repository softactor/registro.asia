<?php

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/
Route::get('/', 'Frontend@index');
Route::get('ongoing_events', 'Frontend@ongoing_events');
Route::get('client_registration/{event_url}', 'Frontend@preview_events_form');
Route::post('client_registration_first_step_varifications', 'Frontend@client_registration_first_step_varifications');
Route::post('client_registration_others_step_varifications', 'Frontend@client_registration_others_step_varifications');
Route::get('confirmation_process', 'Frontend@confirmation_process');
Route::get('preview_of_registration_confirmation', 'Frontend@preview_of_registration_confirmation');
Route::get('client_dashboard', 'Frontend@client_dashboard');
Route::get('client_custome_form_builder', 'Frontend@client_custome_form_builder');
Route::get('su/dashboard', 'Backend@dashboard');
Route::get('su/events', 'Backend@events');
Route::get('su/create_event', 'Backend@create_event');
Route::post('su/store_event', 'Backend@store_event');
Route::get('su/event_form', 'Backend@event_form');
Route::get('su/create_events_form/{event_url}', 'Backend@create_events_form');
Route::get('su/edit_events_form/{event_url}', 'Backend@edit_events_form');
Route::get('su/modify_events_form/{form_id}', 'Backend@modify_events_form');
Route::get('su/preview_events_form/{event_url}', 'Backend@preview_events_form');
Route::post('su/store_events_form', 'Backend@store_events_form');
Route::post('su/get_form_json_data', 'Backend@get_form_json_data');
