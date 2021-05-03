const mix = require('laravel-mix');

/*
 |--------------------------------------------------------------------------
 | Mix Asset Management
 |--------------------------------------------------------------------------
 |
 | Mix provides a clean, fluent API for defining some Webpack build steps
 | for your Laravel applications. By default, we are compiling the CSS
 | file for the application as well as bundling up all the JS files.
 |
 */

mix.js('resources/js/app.js', 'public/js')
    .postCss('resources/css/app.css', 'public/css', [
//
    ]);
mix.js('resources/js/canvas-ui/app.js', 'public/js/canvas-ui.js').vue()
    .sass('resources/sass/canvas-ui.scss', 'public/css/canvas-ui.css');
//
mix.js('vendor/austintoddj/canvas/resources/js/app.js', 'public/vendor/canvas/js/app.js').vue()
    .sass('vendor/austintoddj/canvas/resources/sass/app.scss', 'public/vendor/canvas/css/app.css');