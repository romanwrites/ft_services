FROM	alpine:latest

RUN		apk update && apk upgrade
RUN     apk add grafana --repository=http://dl-3.alpinelinux.org/alpine/edge/testing/

COPY	cfg/grafana.ini /usr/share/grafana/conf/custom.ini
COPY	cfg/datasources.yaml /usr/share/grafana/conf/provisioning/datasources/influxdb.yaml
COPY	cfg/dashboards.yaml /usr/share/grafana/conf/provisioning/dashboards/dashboards.yaml
COPY	cfg/mkristie-dashboard.json /var/lib/grafana/dashboards/mkristie-dashboard.json

EXPOSE	3000

CMD		/usr/sbin/grafana-server --homepath=/usr/share/grafana
