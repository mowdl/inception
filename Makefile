default: all

SSL_CERT_KEY = srcs/nginx/selfsigned.key
SSL_CERT = srcs/nginx/selfsigned.crt

SRCS = $(SSL_CERT_KEY) $(SSL_CERT) \
	   srcs/nginx/nginx.conf \
	   srcs/nginx/Dockerfile \

$(SSL_CERT_KEY) $(SSL_CERT):
	openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
    -keyout $(SSL_CERT_KEY) \
    -out $(SSL_CERT) \
	-subj "/CN=mel-meka.42.fr"

run: all
	docker compose -f srcs/docker-compose.yml up

up: all
	docker compose -f srcs/docker-compose.yml up -d

down:
	docker compose -f srcs/docker-compose.yml down

certs: $(SSL_CERT_KEY) $(SSL_CERT)
