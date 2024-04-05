#!/bin/bash

wp config create    --path='/var/www/wordpress' --allow-root \
                    --dbname=$SQL_DATABASE \
                    --dbuser=$SQL_USER \
                    --dbpass=$SQL_PASSWORD \
                    --dbhost=mariadb:3306

wp core install     --path=/var/www/wordpress --allow-root \
#                    --url=https://arincon.42.fr \
                    --url=https://localhost \
                    --title=$WP_TITLE \
                    --admin_user=$WP_ADMIN_USER \
                    --admin_password=$WP_ADMIN_PASSWORD \
                    --admin_email=$WP_ADMIN_EMAIL \
                    --skip-email


wp user create  --path=/var/www/wordpress --allow-root \
                $WP_USER_LOGIN \
                $WP_USER_EMAIL \
                --user_pass=$WP_USER_PASSWORD


exec /usr/sbin/php-fpm7.4 -F
