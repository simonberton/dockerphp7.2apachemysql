# dockerphp7.2apachemysql
Docker for a Symfony 4.2 project
Using PHP 7.2, mysql and apache.

Install docker compose.

This installation makes 2 images:

symfony-web and symfony-dbserver.

Feel free to change this names on the docker-compose.yml as your needs.

Steps:
0 - Make an .env file with APP_DIR and APP_PORT

Here is mine as an example:

```
APP_DIR=/Users/simonberton/Documents/symfony4/symfony
APP_PORT=8086
```
APP_DIR is where your symfony projects is.
Also: on the web/backend.conf I have set the url, so add that to your hosts file. And accessing it on the port you have set on APP_PORT

For example: www.symfony.local:8086

1 - Install a symfony project with "symfony" as the name folder

2.0 - On your terminal run: ```docker-compose up build -d```

2.1 - ```docker-exec -it symfony-web bash```

2.2 - ```composer install```

2.3 - ```php bin/console doctrine:database:create```

2.4 - ```php bin/console d:s:u --f```