<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateEventFormsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('event_forms', function (Blueprint $table) {
            $table->increments('id');
            $table->integer('event_id')->unsigned()->comment('event id from event table');
            $table->string('lebel_name',500)->nullable()->comment('Lebel name');
            $table->text('form_data')->nullable()->comment('Form Data');
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('event_forms');
    }
}
