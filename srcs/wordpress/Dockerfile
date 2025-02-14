FROM debian:12

RUN apt-get update && apt-get install -y ca-certificates curl php8.2-fpm php8.2-mysql --no-install-recommends; apt-get clean; rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

COPY www.conf /etc/php/8.2/fpm/pool.d/www.conf

COPY wordpress_setup.sh /wordpress_setup.sh

COPY wp-config.php /wp-config.php

RUN rm -rf /var/www/html/*

CMD ["bash", "wordpress_setup.sh"]
