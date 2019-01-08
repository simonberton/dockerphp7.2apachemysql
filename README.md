# dockerphp7.2apachemysql
Docker for a Symfony 4.2 project
Using PHP 7.2, mysql and apache.

Install docker compose.

This installation makes 2 images:
symfony-web and symfony-dbserver.

Feel free to change this names on the docker-compose.yml as your needs.

Steps:
1 - On your terminal run: docker-exec -it symfony-web bash
1.1 - install symfony under a symfony named folder.
1.2 - composer install
1.3 - php bin/console doctrine:database:create
1.4 - php bin/console d:s:u --f