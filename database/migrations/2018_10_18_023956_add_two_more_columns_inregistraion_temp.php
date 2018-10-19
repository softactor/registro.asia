<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class AddTwoMoreColumnsInregistraionTemp extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::table('registraion_temp', function (Blueprint $table) {
            $table->integer('event_id')->nullable()->after("id");
            $table->integer('form_id')->nullable()->after("id");
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::table('registraion_temp', function (Blueprint $table) {
            //
        });
    }
}
