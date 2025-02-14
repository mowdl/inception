cd /var/www/html

mkdir -p /run/php

if [[ $(cat /var/www/html/wp-config.php) ]]; then
	echo "wp-config.php exists. Assuming wordpress is installed."
else
	echo "wp-config.php doesn't exists. Installing wordpress..."

	curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
	chmod +x wp-cli.phar
	mv wp-cli.phar /usr/local/bin/wp

	wp core download --allow-root

	cp /wp-config.php /var/www/html/wp-config.php

	sed -i "s/'WP_DB_NAME'/'$WP_DB_NAME'/g" /var/www/html/wp-config.php
	sed -i "s/'WP_DB_USER'/'$WP_DB_USER'/g" /var/www/html/wp-config.php
	sed -i "s/'WP_DB_USER_PASSWORD'/'$WP_DB_USER_PASSWORD'/g" /var/www/html/wp-config.php
	sed -i "s/'WP_DB_HOST'/'$WP_DB_HOST'/g" /var/www/html/wp-config.php

	wp core install --url=$WP_URL --title=$WP_TITLE --admin_user=$WP_ADMIN_USER --admin_password=$WP_ADMIN_PASSWORD --admin_email=$WP_ADMIN_EMAIL --allow-root
	wp user create $WP_USER $WP_EMAIL --role=author --user_pass=$WP_USER_PASSWORD --allow-root

	wp plugin install redis-cache --activate --allow-root
	wp redis enable --allow-root
fi

chown -R www-data:www-data /var/www/html/wp-content
chmod -R 755 /var/www/html/wp-content

echo running php-fpm...
php-fpm7.4 -F
