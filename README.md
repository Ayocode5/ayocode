#CARA INSTALL

Setup Database:
1. buka xampp lalu aktifkan mysql dan apache 
2. buka phpmyadmin lalu buat database, nama_database:ayocode, type_database:utf8mb4_general_ci
3. import ayocode.sql

Setup WebApp:
1. git clone <url projek> lalu masuk ke directory projek

2. run command 'mv vendor/austintoddj vendor/austintoddj.bak' 

3. run command 'composer install --no-dev'

4. run command 'rm -r vendor/austintoddj && mv vendor/austintoddj.bak vendor/austintoddj'

5. run command 'php artisan storage:link'

6. copy assets ( folder canvas ) ke dalam public/storage/

7. kemudian jalankan applikasi 'php artisan serve'
 
