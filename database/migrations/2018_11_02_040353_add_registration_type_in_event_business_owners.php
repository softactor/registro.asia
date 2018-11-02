<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class AddRegistrationTypeInEventBusinessOwners extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::table('event_business_owners', function (Blueprint $table) {
            $table->string('registration_type',10)->nullable()->after("owners_numbers");
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::table('event_business_owners', function (Blueprint $table) {
            //
        });
    }
}
