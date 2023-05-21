<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class RemoveCatAndChildCatFromProductsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::table('products', function (Blueprint $table) {
           // Drop the foreign key constraints
           $table->dropForeign(['cat_id']);
           $table->dropForeign(['child_cat_id']);

            $table->dropColumn('cat_id');
            $table->dropColumn('child_cat_id');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::table('products', function (Blueprint $table) {
             // Add the columns back
            // $table->unsignedBigInteger('cat_id');
            // $table->unsignedBigInteger('child_cat_id');

          // Add the foreign key constraints
          $table->foreign('cat_id')->references('id')->on('categories');
          $table->foreign('child_cat_id')->references('id')->on('child_categories');
   
        });
    }
}
