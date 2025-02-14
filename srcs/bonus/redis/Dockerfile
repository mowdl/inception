FROM debian:11

RUN apt-get update && apt-get install -y redis-server --no-install-recommends; apt-get clean; rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

CMD ["redis-server", "--bind", "0.0.0.0"]
