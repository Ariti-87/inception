#!/bin/bash

# Start MariaDB service
service mariadb start;

Wait for MariaDB to be ready
while ! mysqladmin ping -h"localhost" --silent; do
    sleep 1
done

# Create database and user
mariadb -e "CREATE DATABASE IF NOT EXISTS \`${SQL_DATABASE}\`;"
mariadb -e "CREATE USER IF NOT EXISTS \`${SQL_USER}\`@'localhost' IDENTIFIED BY '${SQL_PASSWORD}';"
mariadb -e "GRANT ALL PRIVILEGES ON \`${SQL_DATABASE}\`.* TO \`${SQL_USER}\`@'%' IDENTIFIED BY '${SQL_PASSWORD}';"
mariadb -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '${SQL_ROOT_PASSWORD}';"
mariadb -e "FLUSH PRIVILEGES;"

# Stop MariaDB
mysqladmin -u root -p $SQL_ROOT_PASSWORD shutdown

# Start MariaDB in safe mode
exec mysqld_safe