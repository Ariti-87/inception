#!/bin/bash

service mariadb start;

sleep 1

#mariadb -e "UPDATE mysql.user SET Password = PASSWORD('${SQL_ROOT_PASSWORD}') WHERE User = 'root';"
mariadb -e "CREATE DATABASE IF NOT EXISTS \`${SQL_DATABASE}\`;"
mariadb -e "CREATE USER IF NOT EXISTS \`${SQL_USER}\`@'localhost' IDENTIFIED BY '${SQL_PASSWORD}';"
mariadb -e "GRANT ALL PRIVILEGES ON *.* TO \`root\`@'%' IDENTIFIED BY '${SQL_ROOT_PASSWORD}';"
mariadb -e "GRANT ALL PRIVILEGES ON ${SQL_DATABASE}.* TO \`${SQL_USER}\`@'%' IDENTIFIED BY '${SQL_PASSWORD}';"
mariadb -e "FLUSH PRIVILEGES;"

mysqladmin -u root -p$SQL_ROOT_PASSWORD shutdown

exec mysqld_safe