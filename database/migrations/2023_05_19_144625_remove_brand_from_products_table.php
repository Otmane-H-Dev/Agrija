<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class RemoveBrandFromProductsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::table('products', function (Blueprint $table) {
             // Drop the foreign key constraint
             $table->dropForeign('products_brand_id_foreign');
           
            
            // Drop the column
            $table->dropColumn('brand_id');

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
            Schema::table('products', function (Blueprint $table) {
                // Add the column back
                $table->string('brand_id')->after('name');
                  // Add the foreign key constraint back
            $table->foreign('brand_id')
            ->references('id')
            ->on('brands')
            ->onDelete('cascade');
            });
        });
    }
}
