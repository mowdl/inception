(loki -config.file=/loki-config.yaml || exit 1) &

sleep 3

(promtail -config.file=/promtail-config.yml || exit 1) &

sleep 3

grafana-server 2>&1 >/dev/null
