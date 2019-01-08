FROM php:7.2.1-apache

MAINTAINER Simon Berton <simonberton@gmail.com>

RUN apt-get update
RUN apt-get install -y vim git libzip-dev zlib1g-dev zip unzip

# Install php extensions
RUN docker-php-ext-configure zip --with-libzip
RUN docker-php-ext-install pdo pdo_mysql zip

# Install Composer
COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

# Bashrc
RUN rm /root/.bashrc
COPY .bashrc /root/.bashrc

# Cleaning
RUN rm -rf /etc/apache2/sites-available/* && rm -rf /etc/apache2/sites-enabled/*
RUN service apache2 restart
RUN rm -rf /var/www/*

# Conf Apache2
RUN a2enmod rewrite
RUN mkdir /var/www/app
RUN echo "ServerName localhost" >> /etc/apache2/apache2.conf
COPY backend.conf /etc/apache2/sites-available/backend.conf
RUN usermod -u 1000 www-data
RUN a2ensite backend.conf
RUN service apache2 restart

WORKDIR /var/www/app

# EXPOSE 80

CMD ["/usr/sbin/apache2ctl", "-D", "FOREGROUND"]
