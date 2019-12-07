##Notes
1. To check the emails sent use the link: https://mailtrap.io, then login using google account:

   user: testapplaudo@gmail.com
   pass: Test2019

2. You can use any of these users to access to the application (both, in your local or in heroku):
   user: jeovanni.jahm@gmail.com pass: 12345678  role: admin
   user: alex.morales@gmail.com pass: 12345678  role: guest

3. You can find in the root path the file: TestApplaudoStudio.postman_collection.json to run test 
   all the APIs in POSTMAN.

##Sections:
1. How to install in your local
2. How test in Heroku
3. How to run unit tests

##How to install in your local
This steps belong to Linux installation

Requirements:
a. Apache2 server
b. Met the requirements in this link: https://laravel.com/docs/5.8/installation

1. Clone the repository to any location in your PC:
   GITHUB: https://github.com/jahm89/movie_rental

2. Create a .env file in the root of the folder and copy the content from .env.example
   Configure the following parameters:

   DATABASE POSTGRESQL
   DB_CONNECTION=pgsql
   DB_HOST=127.0.0.1
   DB_PORT=5432
   DB_DATABASE=movie_rental_2
   DB_USERNAME=YOURUSER
   DB_PASSWORD=YOURPASSWORD


3. In the console run the following commands (in the root of the folder): 
   composer install
   npm run production
   sudo chmod 777 -R storage public resources


4. Create database

   - Create a database called: movie_rental_2 (mysql or postgresql)
   - In the root path of the application run the command: php artisan migrate

   Alternative: You can use the dump movie-renta-backup.sql in your database,
   the dump is a postgresql database.

5. Create a symbolic link to use the application in your local environment:
   cd /var/www/html
   sudo ln -s PATHTOYOUAPPLICATION/public  movie_rental

   THIS STEP IT'S IMPORTANT CREATE THE SYMBOLIC LINK AS IT IS: movie_rental

6. Access to the application: http://locahost/movie_rental



##How to run unit tests
Then run the command: ./vendor/bin/phpunit
