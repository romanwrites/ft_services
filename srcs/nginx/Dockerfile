FROM	alpine:latest

RUN		apk update && apk upgrade
RUN		apk add nginx openssl openssh openrc supervisor

RUN		adduser -D -g 'www' www
RUN		echo "www:mkristie" | chpasswd

RUN		mkdir /www
RUN		chown -R www:www /var/lib/nginx
RUN		chown -R www:www /www

#openrc устанавливает много пакетов, это чтобы спрятать
VOLUME	["/sys/fs/cgroup"]

RUN		mkdir -p /run/nginx && chown -R nginx:nginx /run/nginx

COPY	./cfg/nginx.conf /etc/nginx/.

COPY	./cfg/nginx-selfsigned.key /etc/nginx/nginx-selfsigned.key
COPY	./cfg/nginx-selfsigned.crt /etc/nginx/nginx-selfsigned.crt

COPY	./cfg/supervisord.conf /etc/supervisord.conf
RUN		chmod +rw /etc/supervisord.conf

# RUN		echo -e "mkristie1\nmkristie1\n" | adduser mkristie
# RUN		echo -e "myPasswordAdm11\nmyPasswordAdm11\n" | adduser mkristie

# RUN		adduser -D -g 'www' www; mkdir /www; \
# 		chown -R www:www /var/lib/nginx; \
# 		chown -R www:www /www;

COPY	./start_nginx.sh .
COPY	./cfg/index.html /www
RUN		chmod u+x start_nginx.sh

EXPOSE	80 443 22

CMD		sh start_nginx.sh
