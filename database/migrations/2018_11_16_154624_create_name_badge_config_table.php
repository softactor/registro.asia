<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateNameBadgeConfigTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('name_badge_config', function (Blueprint $table) {
            $table->increments('id');
            $table->integer('event_id')->unsigned()->comment('event id from event table');
            $table->string('namebadge_width',500)->nullable()->comment('width');
            $table->string('namebadge_height',500)->nullable()->comment('height');
            $table->string('namebadge_orientation',500)->nullable()->comment('orientation');
            $table->string('image_path',800)->nullable()->comment('image_path');
            $table->string('measure_unit',800)->nullable()->comment('unit like inchi, px');
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
        Schema::dropIfExists('name_badge_config');
    }
}
