FROM ubuntu:20.04

ENV DEBIAN_FRONTEND=noninteractive
ENV PHP_VERSION 8.2

RUN apt update && apt-get install -y --no-install-recommends \
    nginx ca-certificates apt-transport-https software-properties-common \
    wait-for-it

RUN add-apt-repository ppa:ondrej/php
RUN apt update && apt install -y php"$PHP_VERSION" \
    php"$PHP_VERSION"-mysql \
    php"$PHP_VERSION"-xml \
    php"$PHP_VERSION"-mbstring \
    php"$PHP_VERSION"-gd \
    php"$PHP_VERSION"-zip \
    php"$PHP_VERSION"-curl \
    php"$PHP_VERSION"-fpm \
    && sed -ri -e 's!;extension=openssl.so!extension=openssl.so!g' /etc/php/8.2/fpm/php.ini

RUN apt install -y curl && \
    curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

COPY docker/nginx/nginx.conf /etc/nginx/nginx.conf
COPY docker/nginx/start /usr/local/bin/start

RUN usermod -u 1000 www-data && groupmod -g 1000 www-data
RUN chmod u+x /usr/local/bin/start

WORKDIR "/var/www/html"

ENTRYPOINT ["/usr/local/bin/start"]
