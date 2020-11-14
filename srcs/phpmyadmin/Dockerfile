FROM	alpine:latest

RUN		apk update && apk upgrade
RUN		apk add nginx openrc supervisor wget

RUN		apk add php7 php7-fpm php7-mysqli \ 
		php7-zlib php7-curl php7-mbstring \
		php7-json php7-session

RUN		mkdir -p /run/nginx && chown -R nginx:nginx /run/nginx

RUN		adduser -D -g 'www' www

RUN		mkdir /www && chown -R www:www /var/lib/nginx && chown -R www:www /www

RUN		wget http://files.directadmin.com/services/all/phpMyAdmin/phpMyAdmin-5.0.2-all-languages.tar.gz
RUN		tar zxvf phpMyAdmin-5.0.2-all-languages.tar.gz
RUN		mv phpMyAdmin-5.0.2-all-languages /www/phpmyadmin
RUN		rm phpMyAdmin-5.0.2-all-languages.tar.gz

COPY	cfg/nginx.conf /etc/nginx/conf.d/default.conf
COPY    cfg/config.inc.php /www/phpmyadmin/
COPY 	cfg/supervisord.conf /etc/supervisord.conf
COPY    start_phpmyadmin.sh .

RUN 	chmod 711 start_phpmyadmin.sh

EXPOSE	5000

CMD		sh start_phpmyadmin.sh
