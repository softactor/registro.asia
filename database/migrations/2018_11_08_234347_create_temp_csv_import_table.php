<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateTempCsvImportTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('temp_csv_import_data', function (Blueprint $table) {
            $table->increments('id');
            $table->integer('event_id')->unsigned()->comment('event id from event table');
            $table->integer('parent_id')->unsigned()->comment('parent Id');
            $table->integer('total_number')->unsigned()->comment('Total Number');
            $table->string('salutation',50)->nullable()->comment('mr or miss or madam');
            $table->string('first_name',500)->nullable()->comment('First name');
            $table->string('last_name',500)->nullable()->comment('Last name');
            $table->string('company_name',500)->nullable()->comment('Company name');
            $table->string('company_address',500)->nullable()->comment('Company address');
            $table->string('gender',15)->nullable()->comment('Male Female or Others');
            $table->string('designation',100)->nullable()->comment('Designation');
            $table->string('mobile',100)->nullable()->comment('Mobile');
            $table->string('country', 200)->nullable()->comment('Country id');
            $table->string('email',100)->nullable()->comment('Email');
            $table->tinyInteger('status')->default(0)->comment('Pending (Yes/No)');
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
        Schema::dropIfExists('temp_csv_import_data');
    }
}
