FROM alpine:latest

Maintainer zanjs Manandhar <zanjser@163.com>

# Add PHP 7
RUN apk upgrade -U && \
    apk --update --repository=http://dl-4.alpinelinux.org/alpine/edge/testing add \
    openssl \
    php7 \
    php7-xml \
    php7-xsl \
    php7-pdo \
    php7-pdo_mysql \
    php7-mcrypt \
    php7-curl \
    php7-json \
    php7-fpm \
    php7-phar \
    php7-openssl \
    php7-mysqli \
    php7-ctype \
    php7-opcache \
    php7-mbstring \
    php7-session \
    php7-pdo_sqlite \
    php7-sqlite3 \
    php7-pcntl && rm /var/cache/apk/*

RUN ln -s /usr/bin/php7 /usr/bin/php

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/bin --filename=composer 

RUN mkdir -p /var/www

WORKDIR /var/www

COPY . /var/www

VOLUME /var/www

CMD ["/bin/sh"]

ENTRYPOINT ["/bin/sh", "-c"]
