FROM	alpine:latest

RUN		apk update && apk upgrade
RUN		apk add wget nginx openrc supervisor php7 php7-fpm php7-mysqli php7-zlib php7-curl php7-mbstring php7-json php7-session

RUN		apk add openrc nginx supervisor

RUN		adduser -D -g 'www' www

RUN		mkdir /www && chown -R www:www /var/lib/nginx && chown -R www:www /www 

RUN		wget https://wordpress.org/latest.zip
RUN		unzip latest.zip
RUN		mv wordpress /www/
RUN		rm latest.zip

COPY	nginx.conf /etc/nginx/conf.d/default.conf
COPY	supervisord.conf /etc/supervisord.conf
COPY	wp-config.php /www/wordpress

COPY	start_wp.sh .
RUN 	chmod 711 start_wp.sh

EXPOSE	5050

CMD		sh start_wp.sh
