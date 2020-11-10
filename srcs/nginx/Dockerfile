FROM	alpine:latest

RUN		apk update && apk upgrade
RUN		apk add nginx openssl openssh openrc supervisor

#openrc устанавливает много пакетов, это чтобы спрятать
VOLUME	["/sys/fs/cgroup"]

RUN		mkdir -p /run/nginx

COPY	./cfg/nginx.conf /etc/nginx/.

COPY	nginx-selfsigned.key /etc/nginx/nginx-selfsigned.key
COPY	nginx-selfsigned.crt /etc/nginx/nginx-selfsigned.crt
# RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
# 	-subj "/C=ru/ST=Moscow/L=Moscow/O=no/OU=no/CN=mkristie/" \
# 	-keyout /etc/nginx/nginx-selfsigned.key -out /etc/nginx/nginx-selfsigned.crt

COPY	./cfg/supervisord.conf /etc/.

RUN		echo -e "mkristie1\mkristie1\n" | adduser mkristie

COPY	./start_nginx.sh .
RUN		chmod u+x /tmp/start.sh

EXPOSE	80 443 22

CMD		sh start_nginx.sh
