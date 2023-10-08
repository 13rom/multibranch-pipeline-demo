FROM php:8-apache

COPY src/ /var/www/html/

RUN docker-php-ext-install mysqli pdo_mysql && docker-php-ext-enable mysqli pdo_mysql
