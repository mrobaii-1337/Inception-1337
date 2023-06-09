#!/bin/bash

sleep 10
wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar

chmod +x wp-cli.phar

mv wp-cli.phar /usr/local/bin/wp

cd /var/www/html/

wp core install --url=$WP_URL --title=$WP_SITE_TITLE --admin_user=$WP_ADMIN_USER \
    --admin_password=$WP_ADMIN_PASS --admin_email=$WP_ADMIN_EMAIL --allow-root

wp user create $WP_USER $WP_USER_EMAIL --role=$WP_USER_ROLE --user_pass=$WP_USER_PASSWORD --allow-root

php-fpm7.3 -F
