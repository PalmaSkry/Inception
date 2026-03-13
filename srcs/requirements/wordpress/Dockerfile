FROM debian:bookworm

RUN apt update -y && apt upgrade -y && apt install -y php-fpm php-mysql wget
RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar \
    -O /usr/local/bin/wp && chmod +x /usr/local/bin/wp

COPY tools/auto_config.sh /auto_config.sh

RUN chmod +x /auto_config.sh

CMD ["/auto_config.sh"]