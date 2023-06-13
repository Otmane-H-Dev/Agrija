const mix = require('laravel-mix');

/*
 |--------------------------------------------------------------------------
 | Mix Asset Management
 |--------------------------------------------------------------------------
 |
 | Mix provides a clean, fluent API for defining some Webpack build steps
 | for your Laravel application. By default, we are compiling the Sass
 | file for the application as well as bundling up all the JS files.
 |0
 */
 mix.styles([
    '/public/frontend/css/style.css',
], '/public/frontend/css/style.min.css');


mix.js('resources/js/app.js', 'public/js')
    .sass('resources/sass/app.scss', 'public/css')
    .version();

    mix.styles([
        'resources/css/app.css',
    ], 'public/css/app.min.css');
    