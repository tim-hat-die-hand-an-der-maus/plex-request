FROM php:8.0-alpine

RUN wget https://github.com/symfony-cli/symfony-cli/releases/download/v5.4.3/symfony-cli_5.4.3_x86_64.apk
RUN apk add --allow-untrusted --no-cache symfony-cli_5.4.3_x86_64.apk

RUN wget https://getcomposer.org/installer -O composer-setup.php

COPY composer.json .
COPY composer.lock .

RUN php composer-setup.php && \
 	php composer.phar install

COPY . .

CMD ["symfony", "server:start"]
