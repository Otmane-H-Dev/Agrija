<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class AddPerformanceIndexes extends Migration
{
    /**
     * Run the migrations - Add missing indexes for foreign keys and frequently filtered columns
     *
     * @return void
     */
    public function up()
    {
        // Add indexes to products table
        Schema::table('products', function (Blueprint $table) {
            $table->index('cat_id');
            $table->index('child_cat_id');
            $table->index('status');
            $table->index('brand_id');
        });

        // Add indexes to product_reviews table
        Schema::table('product_reviews', function (Blueprint $table) {
            $table->index('product_id');
            $table->index('status');
            $table->index('user_id');
        });

        // Add indexes to categories table
        Schema::table('categories', function (Blueprint $table) {
            $table->index('is_parent');
            $table->index('status');
            $table->index('parent_id');
        });

        // Add indexes to carts table for faster lookups
        Schema::table('carts', function (Blueprint $table) {
            $table->index('user_id');
            $table->index('order_id');
        });

        // Add indexes to wishlists table
        Schema::table('wishlists', function (Blueprint $table) {
            $table->index('user_id');
            $table->index('cart_id');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        // Drop indexes from products table
        Schema::table('products', function (Blueprint $table) {
            $table->dropIndex(['cat_id']);
            $table->dropIndex(['child_cat_id']);
            $table->dropIndex(['status']);
            $table->dropIndex(['brand_id']);
        });

        // Drop indexes from product_reviews table
        Schema::table('product_reviews', function (Blueprint $table) {
            $table->dropIndex(['product_id']);
            $table->dropIndex(['status']);
            $table->dropIndex(['user_id']);
        });

        // Drop indexes from categories table
        Schema::table('categories', function (Blueprint $table) {
            $table->dropIndex(['is_parent']);
            $table->dropIndex(['status']);
            $table->dropIndex(['parent_id']);
        });

        // Drop indexes from carts table
        Schema::table('carts', function (Blueprint $table) {
            $table->dropIndex(['user_id']);
            $table->dropIndex(['order_id']);
        });

        // Drop indexes from wishlists table
        Schema::table('wishlists', function (Blueprint $table) {
            $table->dropIndex(['user_id']);
            $table->dropIndex(['cart_id']);
        });
    }
}
