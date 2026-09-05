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

        // Cache and share site settings across all views to prevent redundant DB calls
        View::composer('*', function ($view) {
            try {
                if (Schema::hasTable('settings')) {
                    $settings = \Illuminate\Support\Facades\Cache::remember('site_settings', 86400, function () {
                        return \Illuminate\Support\Facades\DB::table('settings')->get();
                    });
                    $view->with('settings', $settings);
                }
            } catch (\Exception $e) {
                // Fallback gracefully during migrations or if DB is offline
            }
        });
    }
}
