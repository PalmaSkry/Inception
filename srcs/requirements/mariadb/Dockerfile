FROM debian:bookworm

RUN apt update -y && apt upgrade -y && apt install -y mariadb-server

COPY conf/mariadb.conf /etc/mysql/mariadb.conf.d/50-server.cnf

COPY tools/init_db.sh /init_db.sh

RUN chmod +x /init_db.sh

CMD ["/init_db.sh"]
