<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class AddTwoColumnIntoNameBadgePosition extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::table('name_badge_position', function (Blueprint $table) {
            $table->string('left_absulate_value', 100)->nullable()->after("left_value");
            $table->string('top_absulate_value', 100)->nullable()->after("top_value");
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::table('name_badge_position', function (Blueprint $table) {
            //
        });
    }
}
