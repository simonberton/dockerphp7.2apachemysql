#!/bin/bash
cd /home/app
rm -rf app/cache/*

# Install Vendors and Generate Cache with www-data user
su www-data -s /bin/bash -c 'composer install --optimize-autoloader'

su www-data -s /bin/bash -c 'bin/console cache:warmup --env=dev'
su www-data -s /bin/bash -c 'bin/console cache:warmup --env=prod'

# Run apache
apache2ctl -DFOREGROUND
