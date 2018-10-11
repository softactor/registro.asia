<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateEventBusinessOwnersTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('event_business_owners', function (Blueprint $table) {
            $table->increments('id');
            $table->integer('event_id')->unsigned()->comment('event id from event table');
            $table->integer('owners_numbers')->comment('Number of the business owners joined');
            $table->foreign('event_id')->references('id')->on('events');
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
        Schema::dropIfExists('event_business_owners');
    }
}
