<?php

namespace Canvas;

use Canvas\Models\User;
use Illuminate\Support\Facades\File;
use Illuminate\Support\Str;
use RuntimeException;

class Canvas
{
    /**
     * Return the installed version.
     *
     * @return string
     */
    public static function installedVersion(): string
    {
        if (app()->runningUnitTests()) {
            return '';
        }

        $dependencies = json_decode(file_get_contents(base_path('composer.lock')), true)['packages'];

        return collect($dependencies)->firstWhere('name', 'austintoddj/canvas')['version'];
    }

    /**
     * Return a list of available language codes.
     *
     * @return array
     */
    public static function availableLanguageCodes(): array
    {
        $locales = preg_grep('/^([^.])/', scandir(dirname(__DIR__, 1).'/resources/lang'));

        return collect($locales)->each(function ($code) {
            return $code;
        })->toArray();
    }

    /**
     * Return an encoded string of app translations.
     *
     * @param $locale
     * @return string
     */
    public static function availableTranslations($locale): string
    {
        return collect(trans('canvas::app', [], $locale))->toJson();
    }

    /**
     * Return an array of available user roles.
     *
     * @return array
     */
    public static function availableRoles(): array
    {
        return [
            User::CONTRIBUTOR => 'Contributor',
            User::EDITOR => 'Editor',
            User::ADMIN => 'Admin',
        ];
    }

    /**
     * Return true if the publishable assets are up to date.
     *
     * @return bool
     */
    public static function assetsUpToDate(): bool
    {
        if (app()->runningUnitTests()) {
            return true;
        }

        $path = public_path('vendor/canvas/mix-manifest.json');

        $message = sprintf('%s%s.  %s',
            trans('canvas::app.assets_are_not_up_to_date'),
            trans('canvas::app.to_update_run'),
            'php artisan canvas:publish'
        );

        if (! File::exists($path)) {
            throw new RuntimeException($message);
        }

        return File::get($path) === File::get(__DIR__.'/../public/mix-manifest.json');
    }

    /**
     * Return the configured base path url.
     *
     * @return string
     */
    public static function basePath(): string
    {
        return sprintf('/%s', config('canvas.path'));
    }

    /**
     * Return the configured storage path url.
     *
     * @return string
     */
    public static function baseStoragePath(): string
    {
        return sprintf('%s/images', config('canvas.storage_path'));
    }

    /**
     * Return a valid host URL or null.
     *
     * @param  string|null  $url
     * @return string|null
     */
    public static function parseReferer(?string $url): ?string
    {
        if (filter_var($url, FILTER_VALIDATE_URL)) {
            return parse_url($url)['host'];
        }

        return null;
    }

    /**
     * Generate a Gravatar for a given email.
     *
     * @param  string  $email
     * @param  int  $size
     * @param  string  $default
     * @param  string  $rating
     * @return string
     */
    public static function gravatar(
        string $email,
        int $size = 200,
        string $default = 'retro',
        string $rating = 'g'
    ): string {
        $hash = md5(trim(Str::lower($email)));

        return "https://secure.gravatar.com/avatar/{$hash}?s={$size}&d={$default}&r={$rating}";
    }

    /**
     * Return true if dark mode is enabled.
     *
     * @param  int|null  $enabled
     * @return bool
     */
    public static function enabledDarkMode(?int $enabled): bool
    {
        return (bool) $enabled ?: false;
    }

    /**
     * Return true if the app is configured to use Arabic or Farsi.
     *
     * @param  string|null  $locale
     * @return bool
     */
    public static function usingRightToLeftLanguage(?string $locale): bool
    {
        return in_array($locale, ['ar', 'fa']);
    }
}
