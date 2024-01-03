#!/bin/sh

# create database and user, set a root password, grant privileges
if [ ! -d "/var/lib/mysql/wordpress" ]; then
	mariadbd --user=mysql --bootstrap --console <<EOSQL
CREATE DATABASE ${MYSQL_DATABASE};
CREATE USER '${MYSQL_USER}'@'%' IDENTIFIED BY '${MYSQL_PASSWORD}';
GRANT ALL PRIVILEGES ON ${MYSQL_DATABASE}.* TO '${MYSQL_USER}'@'%';
FLUSH PRIVILEGES;
EOSQL
else
	mariadbd --user=mysql --console
fi