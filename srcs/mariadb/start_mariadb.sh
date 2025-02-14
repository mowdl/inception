#!/bin/bash

chown -R mysql:mysql /var/lib/mysql
chmod -R 755 /var/lib/mysql

chown -R mysql:mysql /run/mysqld
chmod -R 755 /run/mysqld

mariadb-install-db --user=mysql && echo installed successfully

mysqld --user=mysql &

while ! mysqladmin ping --silent; do
	sleep 1
done

# Check if the user exists by querying the mysql.user table.
USER_EXISTS=$(mysql -sse \
	"SELECT EXISTS(SELECT 1 FROM mysql.user WHERE user = '$WP_DB_USER' AND host = '$WP_DB_USER_HOST');")

if [ "$USER_EXISTS" -eq 1 ]; then
	echo "User '$WP_DB_USER' already exists."
else
	echo "User '$WP_DB_USER' does not exist. Creating user..."
	mysql -e \
		"CREATE USER '$WP_DB_USER'@'$WP_DB_USER_HOST' IDENTIFIED BY '$WP_DB_USER_PASSWORD';"
	mysql -e \
		"CREATE DATABASE $WP_DB_NAME;"
	# grant privileges:
	mysql -e \
		"GRANT ALL PRIVILEGES ON $WP_DB_NAME.* TO '$WP_DB_USER'@'$WP_DB_USER_HOST'; FLUSH PRIVILEGES;" &&
		echo "User '$WP_DB_USER' created successfully."
fi

mysqladmin shutdown

mysqld --user=mysql
