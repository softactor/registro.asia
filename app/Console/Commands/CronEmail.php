<?php

namespace App\Console\Commands;

use Illuminate\Console\Command;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\View;
use PDF;
use Mail;

class CronEmail extends Command
{
    /**
     * The name and signature of the console command.
     *
     * @var string
     */
    protected $signature = 'registered:users';

    /**
     * The console command description.
     *
     * @var string
     */
    protected $description = 'Send an email of registered users';

    /**
     * Create a new command instance.
     *
     * @return void
     */
    public function __construct()
    {
        parent::__construct();
    }

    /**
     * Execute the console command.
     *
     * @return mixed
     */
    public function handle()
    {
        $details   =   DB::table('event_business_owners_details')
                            ->where('is_status',0)
                            ->where('is_confirmed',1)
                            ->where('email', '!=', '')
                            ->take(2)
                            ->get();
        if (!$details->isEmpty()) {
            foreach($details as $d){
                $event_data         =   DB::table('events')->where('id',$d->event_id)->first();
                $pdfTemplateData    = [
                    'user_data'     => (array)$d,
                    'event_data'    => $event_data,
                    'qrcode'        => public_path('pdf/').$d->qrcode_path
                ];
                //--------------------- mail start
                $title                  = "Event Registration";
                $content                = "Congratulations!<br>You have been successfully registered";
                $emails['to']           = $d->email;
                $emails['attachment']   = public_path('pdf/') . $d->pdf_path;
                $mail                   = Mail::send('template.registration_email', ['title' => $title, 'content' => $pdfTemplateData], function ($message) use ($emails) {
                            $message->from('admin@registro.asia', 'Registro Asia');
                            $message->to($emails['to']);
                            $message->subject("Registro Asia Registration Message");
                            $message->attach($emails['attachment']);
                        });
                $child_data =   [
                    'is_status' =>1
                ];
                DB::table('event_business_owners_details')
                            ->where('id', $d->id)
                            ->update($child_data);
            }// end of foreach        
        }
    }
}
