<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class AddFontStyleColumnInnameBadgePosition extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::table('name_badge_position', function (Blueprint $table) {
            $table->text('font_style')->nullable()->after("top_absulate_value");
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
