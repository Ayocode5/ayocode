#CARA INSTALL

1. git clone <url projek> lalu masuk ke directory projek

2. run command 'mv vendor/austintoddj vendor/austintoddj.bak' 

3. run command 'composer install --no-dev'

4. run command 'rm -r vendor/austintoddj && mv vendor/austintoddj.bak vendor/austintoddj'

5. run command 'php artisan storage:link'

6. copy assets ( folder canvas ) ke dalam public/storage/

7. kemudian jalankan applikasi 'php artisan serve'
 
