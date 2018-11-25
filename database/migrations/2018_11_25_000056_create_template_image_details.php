<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateTemplateImageDetails extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('namebadge_template_details', function (Blueprint $table) {
            $table->increments('id');
            $table->integer('config_id')->unsigned()->comment('config_id from name_badge_config table');
            $table->text('template_name')->nullable()->comment("template_name");
            $table->text('image_path')->nullable()->comment("image_path");
            $table->foreign('config_id')->references('id')->on('name_badge_config')->onDelete('cascade');;
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
        Schema::dropIfExists('namebadge_template_details');
    }
}
