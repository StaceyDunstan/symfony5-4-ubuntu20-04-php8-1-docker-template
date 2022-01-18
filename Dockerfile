FROM ubuntu:20.04

ENV php_version 8.1

COPY . /usr/src/spoke-phone-manager

WORKDIR /usr/src/spoke-phone-manager

COPY --from=composer:latest /usr/bin/composer /usr/local/bin/composer

RUN apt-get update && apt-get -y upgrade
RUN apt install -y ca-certificates apt-transport-https software-properties-common

RUN add-apt-repository ppa:ondrej/php
RUN apt-get -y install vim zip unzip php8.1 php-zip php8.1-curl php8.1-xml

COPY .docker/php/php.ini /tmp/
RUN cat /tmp/php.ini >> /etc/php/$php_version/apache2/php.ini

# Run Apache in the foreground
CMD ["/usr/sbin/apache2ctl", "-DFOREGROUND"]