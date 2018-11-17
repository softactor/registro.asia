<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateNameBadgePositionTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('name_badge_position', function (Blueprint $table) {
            $table->increments('id');
            $table->integer('name_badge_id')->unsigned()->comment('Name badge id');
            $table->integer('event_id')->unsigned()->comment('event id from event table');
            $table->integer('field_id')->unsigned()->comment('field id');
            $table->string('left_value',500)->nullable()->comment('left value');
            $table->string('top_value',500)->nullable()->comment('top value');
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
        Schema::dropIfExists('name_badge_position');
    }
}
