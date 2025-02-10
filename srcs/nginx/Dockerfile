FROM debian:12

RUN apt-get update && apt-get install -y nginx=1.22.1-9 --no-install-recommends; apt-get clean; rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

COPY nginx.conf /etc/nginx/nginx.conf

COPY selfsigned.crt /etc/ssl/certs/selfsigned.crt
COPY selfsigned.key /etc/ssl/private/selfsigned.key

CMD ["nginx", "-g", "daemon off;"]
