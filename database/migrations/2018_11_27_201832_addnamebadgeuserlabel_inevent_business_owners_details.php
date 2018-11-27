<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class AddnamebadgeuserlabelIneventBusinessOwnersDetails extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::table('event_business_owners_details', function (Blueprint $table) {
            $table->text('namebadge_user_label')->nullable()->after("serial_digit");
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
