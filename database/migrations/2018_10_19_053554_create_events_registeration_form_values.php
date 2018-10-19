<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateEventsRegisterationFormValues extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('event_registeration_form_values', function (Blueprint $table) {
            $table->increments('id');
            $table->integer('event_id')->nullable()->comment("event id");
            $table->integer('form_id')->nullable()->comment("form id");
            $table->string('label_name',500)->nullable()->comment('Lebel name');
            $table->text('label_value')->nullable()->comment('Form Data');
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
        Schema::dropIfExists('event_registeration_form_values');
    }
}
