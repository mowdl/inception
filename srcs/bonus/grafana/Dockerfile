FROM debian:11

# RUN apt update && apt install -y adduser libfontconfig1 musl wget; \
# 	wget https://dl.grafana.com/oss/release/grafana_11.5.1_amd64.deb; \
# 	dpkg -i grafana_11.5.1_amd64.deb; \
# 	rm grafana_11.5.1_amd64.deb; \
# 	apt-get clean;

RUN apt-get update && apt-get install -y gpg wget

RUN mkdir -p /etc/apt/keyrings/; \
	wget -q -O - https://apt.grafana.com/gpg.key | gpg --dearmor > /etc/apt/keyrings/grafana.gpg; \
	echo "deb [signed-by=/etc/apt/keyrings/grafana.gpg] https://apt.grafana.com stable main" | tee /etc/apt/sources.list.d/grafana.list;

RUN apt-get update && apt-get install -y grafana loki promtail; \
	apt-get clean; \
	rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*;

COPY ./conf/grafana_setup.sh /grafana_setup.sh
COPY ./conf/loki-config.yaml /loki-config.yaml
COPY ./conf/promtail-config.yml /promtail-config.yml

WORKDIR /usr/share/grafana

CMD ["bash", "/grafana_setup.sh"]
