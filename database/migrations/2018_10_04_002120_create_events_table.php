<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateEventsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('events', function (Blueprint $table) {
            $table->increments('id');
            $table->string('title',500)->nullable()->comment('Name of the event');
            $table->string('organizer',500)->nullable()->comment('Name of the event organizer');
            $table->date('start_date')->comment('Event start date');
            $table->date('end_date')->comment('Event end date');
            $table->string('venue_name',500)->nullable()->comment('Name of the event vanue');
            $table->string('venue_address',500)->nullable()->comment('Name of the event vanue address');
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
        Schema::dropIfExists('events');
    }
}
