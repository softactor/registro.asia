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
/*
 *          CLIENT REGISTRATION:
 */
Route::get('client_registration/{event_url}', 'Frontend@preview_events_form');
Route::post('client_registration_first_step_varifications', 'Frontend@client_registration_first_step_varifications');
Route::post('client_registration_others_step_varifications', 'Frontend@client_registration_others_step_varifications');
Route::get('confirmation_process', 'Frontend@confirmation_process');
Route::get('preview_of_registration_confirmation', 'Frontend@preview_of_registration_confirmation');
/*
 *          CLIENT DASHBOARD
 */
Route::get('client_dashboard', 'Frontend@client_dashboard');
Route::get('client_custome_form_builder', 'Frontend@client_custome_form_builder');
/*
 *          SUPER ADMIN DASHBOARD
 */
Route::get('su/dashboard', 'Backend@dashboard');
//          EVENTS
Route::get('su/events', 'Backend@events');
Route::get('su/create_event', 'Backend@create_event');
Route::post('su/store_event', 'Backend@store_event');
Route::get('su/edit_event/{event_url}', 'Backend@edit_event');
Route::get('su/generateEmbeddedEventsUrl', 'Backend@generateEmbeddedEventsUrl');

//          EVENTS FORM
Route::get('su/event_form', 'Backend@event_form');
Route::get('su/create_events_form/{event_url}', 'Backend@create_events_form');
Route::get('su/edit_events_form/{event_url}', 'Backend@edit_events_form');
Route::get('su/modify_events_form/{form_id}', 'Backend@modify_events_form');
Route::get('su/preview_events_form/{event_url}', 'Backend@preview_events_form');
Route::post('su/store_events_form', 'Backend@store_events_form');
Route::post('su/get_form_json_data', 'Backend@get_form_json_data');

//          NAME BADGE VIEW
Route::get('su/name_badge_view', 'Backend@name_badge_view');
Route::get('su/get_registration_tickets', 'Backend@get_registration_tickets');
Route::post('su/get_events_registrated_users', 'Backend@get_events_registrated_users');
Route::get('su/print_events_name_badge', 'Backend@print_events_name_badge');
Route::get('su/print_namebadge_status_updater', 'Backend@print_namebadge_status_updater');
Route::get('su/name_badge_config', 'Namebadge\NameBadgeController@name_badge_config');
Route::post('su/name_badge_config_store', 'Namebadge\NameBadgeController@name_badge_config_store');
Route::get('su/name_badge_set_position', 'Namebadge\NameBadgeController@name_badge_set_position');
Route::get('su/name_badge_background_by_event', 'Namebadge\NameBadgeController@name_badge_background_by_event');
Route::post('su/name_badge_set_position_store', 'Namebadge\NameBadgeController@name_badge_set_position_store');
Route::get('su/name_badge_field_delete', 'Namebadge\NameBadgeController@name_badge_field_delete');
Route::post('su/saveNamebadgeFontStyle', 'Namebadge\NameBadgeController@saveNamebadgeFontStyle');
Route::get('su/name_badge_template_delete', 'Namebadge\NameBadgeController@name_badge_template_delete');
Route::get('su/default_namebadge_template', 'Namebadge\NameBadgeController@default_namebadge_template');
Route::get('su/name_badge_config_details', 'Namebadge\NameBadgeController@get_name_badge_config_details');

//          REGISTRATION
Route::get('su/registration_details_list', 'Backend@registration_details_list');
Route::get('su/registration_details_view/{event_id}', 'Backend@registration_details_view');
Route::get('su/backend/registration/{event_url}/{reg_prefix}', 'Backend@backend_registration');
Route::post('su/backend/registration/csv_import', 'Backend@csv_import');
Route::get('su/backend/registration_import/confirm_csv_uploader/{business_owner_id}/{event_url}', 'Backend@confirm_csv_uploader');
Route::get('su/backend/csv_uploader_view/{event_url}', 'Backend@csv_uploader_view');
Route::post('su/backend/csv_data/store', 'Backend@csv_data_store');
Route::get('su/get_event_business_owners_details', 'Backend@get_event_business_owners_details');
Route::get('su/user_registration_details', 'Backend@user_registration_details');
Route::post('su/event_business_owners_details_store', 'Backend@event_business_owners_details_store');
Route::post('su/user_wise_question_answer_store', 'Backend@user_wise_question_answer_store');

//          PDF GENERATES
Route::get('pdf_test', 'Frontend@pdf_test');
Route::get('cron_email_test', 'Frontend@cron_email_test');
//          API preview page
Route::get('api_reg_form', 'api\ApiController@index_test');

// OTHERWEBSITE REGISTRATION
Route::get('iframe/event_registration/{event_url}', 'Frontend@iframe_events_form');
// SETTINGS
Route::get('su/settings', 'Settings\SettingsController@index');
Route::get('su/send_corn_email', 'Frontend@send_corn_email');
Route::get('su/printing_layout_config', 'Settings\SettingsController@printing_layout_config');   //          PRINTING LAYOUT CONFIG
Route::get('su/get_event_print_configuration', 'Settings\SettingsController@get_event_print_configuration');   //          PRINTING LAYOUT CONFIG
Route::post('su/savePrintLayoutConfiguration', 'Settings\SettingsController@savePrintLayoutConfiguration');   //          PRINTING LAYOUT CONFIG
Route::post('su/saveNameBadgeLabel', 'Settings\SettingsController@saveNameBadgeLabel');   //          PRINTING LAYOUT CONFIG
Route::get('su/deleteNamebadgeValues', 'Settings\SettingsController@deleteNamebadgeValues');   //          PRINTING LAYOUT CONFIG
//*******************************COMPOSER*************************************************
Route::get('su/event_wise_mail_composer', 'Settings\SettingsController@eventWiseMailComposer');
Route::post('su/event_wise_mail_composer_store', 'Settings\SettingsController@eventWiseMailComposerStore');
Route::get('su/get_email_text', 'Settings\SettingsController@getEmailText');

//*******************************PDF COMPOSER*************************************************
Route::get('su/event_wise_pdf_composer', 'Settings\SettingsController@eventWisePdfComposer');
Route::post('su/event_wise_pdf_composer_store', 'Settings\SettingsController@eventWisePdfComposerStore');
Route::get('su/get_pdf_text', 'Settings\SettingsController@getPdfText');

//          Pending queue confirmation
Route::get('su/backend/registration_import_status/{is_confirmed}/{event_id}', 'Backend@registration_import_status');
    
// **********************************REPORTS******************************************************************
Route::get('/get_events_chart_data', 'Reports\ChartController@get_events_chart_data');
Route::get('su/getEventCustomForm', 'Reports\ReportsController@getEventCustomForm');
Route::get('su/reports', 'Reports\ReportsController@index');
Route::get('su/get_reports', 'Reports\ReportsController@get_reports');
Route::get('su/reports_custom_filter', 'Reports\ReportsController@reports_custom_filter');
Route::get('su/get_custom_filter_report', 'Reports\ReportsController@getCustomFilterReport');
Route::get('su/reports_grphic_view', 'Reports\ReportsController@reports_grphic_view');
Route::get('su/reports_pdf_download', 'Reports\ReportsController@reports_pdf_download');

Route::get('su/quick_reports_view', 'Reports\ReportsController@quick_reports_view');
Route::get('su/get_quick_reports_data', 'Reports\ReportsController@get_quick_reports_data');
Route::get('su/complete_reports', 'Reports\ReportsController@complete_reports');
Route::post('su/get_complete_report_pdf', 'Reports\ReportsController@get_complete_report_pdf');
Route::post('su/generate_complete_report_pdf', 'Reports\ReportsController@generate_complete_report_pdf');

// **************************************bulk print and email**************************************************

Route::get('su/saveNameBadgeIdIntoSession', 'Backend@saveNameBadgeIdIntoSession');
Route::get('su/printBulkNameBadge', 'Backend@print_bulk_name_badge');
Route::get('su/bulkNameBadgePrint', 'Backend@bulk_name_badge_print');
Route::get('su/sendBulkEmail', 'Backend@send_bulk_email');
Route::get('su/sendBulkEmailStatus', 'Backend@send_bulk_email_status');
Route::get('su/scan_qrcode', 'Backend@scan_qrcode');
Route::get('su/get_user_data_by_serial_number', 'Backend@get_user_data_by_serial_number');


Route::get('su/test_pdf_text_check', 'Settings\SettingsController@test_pdf_text_check');