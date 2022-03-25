FROM php:8.1-alpine

RUN wget https://github.com/symfony-cli/symfony-cli/releases/download/v5.4.3/symfony-cli_5.4.3_x86_64.apk
RUN apk add --allow-untrusted --no-cache symfony-cli_5.4.3_x86_64.apk

RUN wget https://getcomposer.org/installer -O composer-setup.php

COPY composer.json .
COPY composer.lock .
COPY symfony.lock .
COPY bin bin
COPY assets assets
COPY config config
COPY migrations migrations
COPY public public
COPY src src
COPY translations translations
COPY .env .env

ENV APP_ENV prod

RUN php composer-setup.php && \
 	php composer.phar install

CMD ["symfony", "server:start"]
