default: run

SSL_CERT_KEY = srcs/nginx/conf/selfsigned.key
SSL_CERT = srcs/nginx/conf/selfsigned.crt

BONUS_SSL_CERT_KEY = srcs/bonus/nginx/conf/selfsigned.key
BONUS_SSL_CERT = srcs/bonus/nginx/conf/selfsigned.crt



run:
	docker compose -f srcs/docker-compose.yml up --build

up:
	docker compose -f srcs/docker-compose.yml up -d --build

down:
	docker compose -f srcs/docker-compose.yml down

certs:
	openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
    -keyout $(SSL_CERT_KEY) \
    -out $(SSL_CERT) \
	-subj "/CN=mel-meka.42.fr"

certs_bonus:
	openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
    -keyout $(BONUS_SSL_CERT_KEY) \
    -out $(BONUS_SSL_CERT) \
	-subj "/CN=mel-meka.42.fr"



bonus_run:
	docker compose -f srcs/bonus/docker-compose.yml up --build
