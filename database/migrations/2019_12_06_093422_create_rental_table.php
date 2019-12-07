<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateRentalTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('rental', function (Blueprint $table) {
            $table->increments('id');
            $table->date('return_deadline');
            $table->date('return_date')->nullable();
            $table->integer('movie_id')->unsigned();
            $table->integer('user_id')->unsigned();
            $table->double('penalty', 8, 2);
            $table->timestamps();
        });

        Schema::table('rental', function($table) {
            $table->foreign('movie_id')->references('id')->on('movie');
            $table->foreign('user_id')->references('id')->on('users');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('rental');
    }
}
