FROM php:5.6-apache
MAINTAINER wish@baffedu.com

RUN apt-get update && apt-get -y install git curl zip libmagickwand-dev \
    && apt-get -y autoremove && apt-get clean && rm -rf /var/lib/apt/lists/*
RUN pecl install imagick
RUN docker-php-ext-install bcmath pdo_mysql mbstring gd zip mysqli
RUN docker-php-ext-enable imagick gd zip mysqli

RUN /usr/sbin/a2enmod rewrite
