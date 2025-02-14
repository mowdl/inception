FROM debian:11

RUN apt-get update && apt-get install -y nginx --no-install-recommends; apt-get clean; rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

COPY conf/nginx.conf /etc/nginx/nginx.conf

COPY conf/selfsigned.crt /etc/ssl/certs/selfsigned.crt
COPY conf/selfsigned.key /etc/ssl/private/selfsigned.key

CMD ["nginx", "-g", "daemon off;"]
