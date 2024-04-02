FROM        debian:buster
RUN         apt update
RUN         apt install -y wget\
            php7.3\
            php-fpm\
            php-mysql\
            mariadb-client
RUN         wget https://fr.wordpress.org/wordpress-6.4.3-fr_FR.tar.gz -P /var/www
RUN         cd /var/www && tar -xzf wordpress-6.4.3-fr_FR.tar.gz && rm wordpress-6.4.3-fr_FR.tar.gz
RUN         chmod 755 /var/www/wordpress
RUN		    chown -R root:root /var/www/wordpress
RUN         echo "listen=9000" >> /etc/php/7.3/fpm/pool.d/www.conf 
RUN         wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN         chmod +x wp-cli.phar
RUN         mv wp-cli.phar /usr/local/bin/wp
COPY	    ./conf/entrypoint.sh /entrypoint.sh
RUN         chmod 755 /entrypoint.sh
EXPOSE      9000
ENTRYPOINT  ["./entrypoint.sh"]