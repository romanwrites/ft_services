FROM	alpine:latest

RUN		apk update && apk upgrade
RUN     apk add grafana --repository=http://dl-3.alpinelinux.org/alpine/edge/testing/
# RUN		wget https://dl.grafana.com/oss/release/grafana-7.3.2.linux-amd64.tar.gz
# RUN		tar -zxvf grafana-7.3.2.linux-amd64.tar.gz
EXPOSE	3000

CMD		/usr/sbin/grafana-server --homepath=/usr/share/grafana
# --homepath=/usr/share/grafana