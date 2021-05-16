<!DOCTYPE html>
<html>
<body>
<h1> CARA INSTALL Peler</h1>

<h2> Setup Database </h2>
<ul>
    <li> buka xampp lalu aktifkan mysql dan apache</li>
    <li> buka phpmyadmin lalu buat database, nama_database:ayocode, type_database:utf8mb4_general_ci</li>
    <li> import ayocode.sql</li>
</ul>

<h2> Setup WebApp </h2>
<ul>
    <li>
        git clone <url projek> lalu masuk ke directory projek
    </li>
    <li>
        run command 'mv vendor/austintoddj vendor/austintoddj.bak'
    </li>
    <li>
        run command 'composer install --no-dev'
    </li>
    <li>
        run command 'rm -r vendor/austintoddj && mv vendor/austintoddj.bak vendor/austintoddj'
    </li>
    <li>
        run command 'php artisan storage:link'
    </li>
    <li>
        copy assets ( folder canvas ) ke dalam public/storage/
    </li>
    <li>
        kemudian jalankan applikasi 'php artisan serve'
    </li>
</ul>
<h3> Cara modifikasi tampilan frontend </h3>
NOTE: frontend menggunakan vue.js, 

1. Install dependency node.js
run command 'npm install' lalu 'npm run dev'
2. Install laravel/mix
run command 'composer require laravel/mix'
3. Modifikasi tampilan/component vue.js ada di folder resources/js/canvas-ui/

NOTE: setelah melakukan modifikasi, jalan perintah 'npm run dev'

</body>
</html>
