<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class AddUserEventBusinessOwnersIdIneventRegisterationFormValues extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::table('event_registeration_form_values', function (Blueprint $table) {
            $table->integer('user_register_id')->nullable()->after("id");
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::table('event_registeration_form_values', function (Blueprint $table) {
            //
        });
    }
}
