<?php

namespace App\Providers;

use Illuminate\Support\Facades\URL;
use Illuminate\Support\Facades\Schema;
use Illuminate\Support\ServiceProvider;

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

    // This forces HTTPS regardless of the environment if accessed via a secure URL
    if (isset($_SERVER['HTTPS']) && $_SERVER['HTTPS'] === 'on') {
        URL::forceScheme('https');
    }
    
    // OR: Just force it completely if you know the site is live
    if (env('APP_ENV') !== 'local') {
        URL::forceScheme('https');
    }
}
}
