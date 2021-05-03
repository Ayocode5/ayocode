<!DOCTYPE=html>
<html>
<head>
    <style>
        ul, li {list-style-type: none;}
    </style>
</head>
<body>
<h1> CARA INSTALL </h1>

<h2> Setup Database </h2>
<ul>
    <li>1. buka xampp lalu aktifkan mysql dan apache</li>
    <li>2. buka phpmyadmin lalu buat database, nama_database:ayocode, type_database:utf8mb4_general_ci</li>
    <li>3. import ayocode.sql</li>
</ul>

<h2> Setup WebApp </h2>
1. git clone <url projek> lalu masuk ke directory projek

2. run command 'mv vendor/austintoddj vendor/austintoddj.bak' 

3. run command 'composer install --no-dev'

4. run command 'rm -r vendor/austintoddj && mv vendor/austintoddj.bak vendor/austintoddj'

5. run command 'php artisan storage:link'

6. copy assets ( folder canvas ) ke dalam public/storage/

7. kemudian jalankan applikasi 'php artisan serve'
 
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
