##Notes
1. To check the emails sent use the link: https://mailtrap.io, then login using google account:

   user: testapplaudo@gmail.com
   pass: Test2019

2. You can use any of these users to access to the application:
   user: alex.jahm@gmail.com pass: 123456  role: admin
   user: jeovanni.jahm@gmail.com pass: 123456  role: guest

##How install
This steps belong to Linux installation

1. Download the repository to any location in your PC:
   GITHUB: https://github.com/jahm89/movie_rental

2. Create a .env file in the root of the folder and copy the content from .env.example
   Configure the following parameters:

   DATABASE MYSQL
   DB_HOST=127.0.0.1
   DB_PORT=3306
   DB_DATABASE=movie_rental
   DB_USERNAME=YOURUSER
   DB_PASSWORD=YOURPASSWORD

3. In the console run the following commands (in the root of the folder): 
   composer install
   npm run production
   sudo chmod 777 -R storage
   sudo chmod 777 -R public


4. In your database manager for mysql apply the dump: movie_rental-backup.sql located in the root.

5. Create a symbolic link to use the application in your local environment:
   cd /var/www/html
   sudo ln -s PATHTOYOUAPPLICATION/public  movie_rental

6. Access to the application: http://locahost/movie_rental



##How to run unit tests
Then run the command: ./vendor/bin/phpunit
