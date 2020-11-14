# php-fpm7
# nginx -g "daemon off;"
mkdir /run/nginx

chmod 744 /run/nginx
/usr/bin/supervisord -c /etc/supervisord.conf