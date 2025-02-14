FROM debian:11

RUN apt-get update && apt-get install -y ca-certificates curl php-fpm php-mysql php-redis --no-install-recommends; apt-get clean; rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

COPY conf/www.conf /etc/php/7.4/fpm/pool.d/www.conf

COPY tools/wordpress_setup.sh /wordpress_setup.sh

COPY conf/wp-config.php /wp-config.php

RUN rm -rf /var/www/html/*

CMD ["bash", "wordpress_setup.sh"]
