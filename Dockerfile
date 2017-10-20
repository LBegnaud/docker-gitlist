FROM php:apache

MAINTAINER Benoit NORRIN <benoit@norrin.fr>

RUN apt-get update && apt-get install -y git && rm -rf /var/lib/apt/lists/*
RUN a2enmod rewrite

ENV GITLIST_DOWNLOAD_URL 'https://github.com/klaussilveira/gitlist/releases/download/0.6.0/gitlist-0.6.0.tar.gz'

RUN mkdir -p /home/git/repositories/ \
        && cd /home/git/repositories/ \
        && git --bare init foo

RUN curl -o /tmp/gitlist.tar.gz -SL ${GITLIST_DOWNLOAD_URL} \
        && tar -xzf /tmp/gitlist.tar.gz -C /tmp/ \
        && mv /tmp/gitlist/.htaccess /tmp/gitlist/* /var/www/html/ \
        && rm -rf /tmp/gitlist /tmp/gitlist.tar.gz \
        && chown -R www-data:www-data /var/www/html/ \
        && cd /var/www/html/ \
        && mkdir cache \
        && chmod 777 cache \
        && cp /var/www/html/config.ini-example /var/www/html/config.ini

VOLUME /var/www/html
WORKDIR /var/www/html/
