FROM	alpine:latest

RUN		apk update && apk upgrade
RUN		apk add vsftpd 

COPY	cfg/ftps-selfsigned.crt /etc/ssl/certs/ftps-selfsigned.crt
COPY	cfg/ftps-selfsigned.key /etc/ssl/private/ftps-selfsigned.key

RUN		echo -e "mkristie\nmkristie\n" | adduser mkristie -s /bin/false -h /mkristie
RUN		chown mkristie:mkristie /mkristie

COPY	cfg/vsftpd.conf /etc/vsftpd/vsftpd.conf
COPY	start_vsftpd.sh .
RUN		chmod +x start_vsftpd.sh

EXPOSE	20 21 21000

CMD		sh start_vsftpd.sh