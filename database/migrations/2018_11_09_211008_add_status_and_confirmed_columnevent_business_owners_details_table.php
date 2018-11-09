<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class AddStatusAndConfirmedColumneventBusinessOwnersDetailsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::table('event_business_owners_details', function (Blueprint $table) {
            $table->integer('is_status')->default(1)->after("serial_digit");
            $table->integer('is_confirmed')->default(1)->after("serial_digit");
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
