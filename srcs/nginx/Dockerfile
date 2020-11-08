FROM alpine:latest

RUN apk update && apk upgrade
RUN apk add nginx openssl openssh openrc supervisor

#openrc устанавливает много пакетов, это чтобы спрятать
VOLUME ["/sys/fs/cgroup"]

RUN mkdir -p /run/nginx

RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
	-subj "/C=ru/ST=Moscow/L=Moscow/O=no/OU=no/CN=mkristie/" \
	-keyout /etc/nginx/nginx-selfsigned.key -out /etc/nginx/nginx-selfsigned.crt

COPY start_nginx.sh .
COPY cfg/supervisord.conf /etc/
COPY cfg/nginx.conf /etc/nginx/
EXPOSE 22 80 443

CMD sh start_nginx.sh
