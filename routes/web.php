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
Route::get('client_registration/{event_url}', 'Frontend@client_registration');
Route::post('client_registration', 'Frontend@process_client_registration');
Route::get('client_dashboard', 'Frontend@client_dashboard');
Route::get('client_custome_form_builder', 'Frontend@client_custome_form_builder');
Route::get('su/dashboard', 'Backend@dashboard');
Route::get('su/events', 'Backend@events');
Route::get('su/create_event', 'Backend@create_event');
Route::post('su/store_event', 'Backend@store_event');
Route::get('su/event_form', 'Backend@event_form');
Route::get('su/create_events_form/{event_url}', 'Backend@create_events_form');
Route::post('su/store_events_form', 'Backend@store_events_form');
Route::get('su/preview_events_form/{event_url}', 'Backend@preview_events_form');
