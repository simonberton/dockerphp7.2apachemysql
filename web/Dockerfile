FROM php:7.2.1-apache
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




# //SIMON///
# RUN a2enmod rewrite
# ADD backend.conf /etc/apache2/sites-available/

# RUN rm /etc/apache2/sites-enabled/000-default.conf

# RUN ln -s /etc/apache2/sites-available/backend.conf /etc/apache2/sites-enabled/06-backend.conf

# RUN echo 'deployer:x:333:333::/home:/bin/bash' >> /etc/passwd
# RUN echo 'deployer:*:16828:0:99999:7:::' >> /etc/shadow
# RUN echo 'deployer:x:333:' >> /etc/group

# # RUN phpenmod mcrypt

# # RUN sed -i "s/export APACHE_RUN_USER=www-data/export APACHE_RUN_USER=deployer/" /etc/apache2/envvars
# # RUN sed -i "s/export APACHE_RUN_GROUP=www-data/export APACHE_RUN_GROUP=deployer/" /etc/apache2/envvars

# # Install Composer
# RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/bin/ --filename=composer

# EXPOSE 80

# # Copy Run Script
# ADD bin/run.sh /bin/
# RUN chmod +x /bin/run.sh

# # Run
# CMD /bin/run.sh
