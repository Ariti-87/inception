FROM    debian:buster
RUN     apt update && apt install 
RUN     apt-get install mariadb-server -y
RUN     apt install vim -y
RUN     apt install curl -y
COPY    conf/50-server.cnf	/etc/mysql/mariadb.conf.d/50-server.cnf
COPY	./conf/entrypoint.sh /entrypoint.sh
RUN     chmod 755 /entrypoint.sh
EXPOSE  3306
ENTRYPOINT ["./entrypoint.sh"]