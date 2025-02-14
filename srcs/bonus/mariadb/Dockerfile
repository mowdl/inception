FROM debian:11


RUN apt-get update && apt-get install -y mariadb-server --no-install-recommends; apt-get clean; rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

COPY ./conf/50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf

RUN mkdir -p /run/mysqld

COPY tools/start_mariadb.sh /start_mariadb.sh


CMD ["bash", "/start_mariadb.sh"]
