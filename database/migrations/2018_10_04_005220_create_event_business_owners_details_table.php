<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateEventBusinessOwnersDetailsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('event_business_owners_details', function (Blueprint $table) {
            $table->increments('id');
            $table->integer('event_id')->unsigned()->comment('event id from event table');
            $table->integer('business_owner_id')->unsigned()->comment('business owner id from event_business_owners table');
            $table->string('salutation',50)->nullable()->comment('mr or miss or madam');
            $table->string('first_name',500)->nullable()->comment('First name');
            $table->string('last_name',500)->nullable()->comment('Last name');
            $table->string('company_name',500)->nullable()->comment('Company name');
            $table->string('company_address',500)->nullable()->comment('Company address');
            $table->string('gender',15)->nullable()->comment('Male Female or Others');
            $table->string('designation',100)->nullable()->comment('Designation');
            $table->string('mobile',100)->nullable()->comment('Mobile');
            $table->integer('country_id')->nullable()->comment('Country id');
            $table->string('tel',100)->nullable()->comment('Telephone');
            $table->string('fax',100)->nullable()->comment('Fax');
            $table->string('email',100)->nullable()->comment('Email');
            $table->foreign('event_id')->references('id')->on('events');
            $table->foreign('business_owner_id')->references('id')->on('event_business_owners');
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
        Schema::dropIfExists('event_business_owners_details');
    }
}
