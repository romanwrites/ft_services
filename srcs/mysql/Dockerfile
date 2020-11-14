FROM	alpine:latest

RUN		apk update && apk upgrade
RUN		apk add mariadb mariadb-client openrc

VOLUME	["/sys/fs/cgroup"]

COPY	create_db.sql .
COPY	my.cnf /etc/
COPY	wp_db.sql .
COPY	start_mysql.sh .
RUN		chmod +x start_mysql.sh

VOLUME	["/var/lib/mysql"]

EXPOSE	3306

CMD		sh start_mysql.sh