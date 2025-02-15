FROM debian:11

RUN apt-get update && apt-get install -y php php-mysql wget ca-certificates --no-install-recommends; apt-get clean; rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN mkdir /adminer
WORKDIR /adminer

RUN wget -O index.php https://www.adminer.org/latest.php


CMD ["php", "-S", "0.0.0.0:8000"]
