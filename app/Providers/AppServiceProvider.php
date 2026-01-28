<?php

namespace App\Providers;

use Illuminate\Support\Facades\URL;
use Illuminate\Support\Facades\Schema;
use Illuminate\Support\Facades\View;
use Illuminate\Support\ServiceProvider;
use App\Http\Helpers;

class AppServiceProvider extends ServiceProvider
{
    /**
     * Register any application services.
     *
     * @return void
     */
    public function register()
    {
        //
    }

    /**
     * Bootstrap any application services.
     *
     * @return void
     */
    public function boot()
    {
        Schema::defaultStringLength(191);

        // Only force HTTPS in production environment
        if (env('APP_ENV') === 'production') {
            URL::forceScheme('https');
        }

        // Share cart and wishlist counts globally to avoid repeated queries
        View::share('global_cart_count', Helpers::cartCount());
        View::share('global_wishlist_count', Helpers::wishlistCount());
    }
}
