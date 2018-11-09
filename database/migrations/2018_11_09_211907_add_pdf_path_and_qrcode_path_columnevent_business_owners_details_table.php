<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class AddPdfPathAndQrcodePathColumneventBusinessOwnersDetailsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::table('event_business_owners_details', function (Blueprint $table) {
            $table->text('pdf_path')->nullable()->after("is_status");
            $table->text('qrcode_path')->nullable()->after("is_status");
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::table('event_business_owners_details', function (Blueprint $table) {
            //
        });
    }
}
