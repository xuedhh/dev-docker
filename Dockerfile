FROM php:7.4-fpm-buster

LABEL OS=Debian10 \
  PHP=7.4

ENV LANG=en_US.UTF-8 \
  LANGUAGE=en_US.UTF-8 \
  TZ=Asia/Shanghai

RUN set -eux \
  && sed -i "s/snapshot.debian.org/mirrors.aliyun.com/g" /etc/apt/sources.list \
  && sed -i "s/security.debian.org/mirrors.aliyun.com/g" /etc/apt/sources.list \
  && sed -i "s/deb.debian.org/mirrors.aliyun.com/g" /etc/apt/sources.list \
  && cat /etc/apt/sources.list \
  && apt-get update \
  && apt-get install -y --no-install-recommends \
  apt-transport-https ca-certificates libpng-dev libjpeg-dev libjpeg62-turbo-dev libfreetype6-dev zip \
  fontconfig libxrender-dev libxext-dev librdkafka-dev libzip-dev libonig-dev locales libmagickwand-dev \
  procps supervisor cron wget net-tools git iputils-ping telnet vim unzip \
  && pecl install -o -f redis \
  && pecl install -o -f rdkafka \
  && pecl install -o -f imagick \
  && pecl install -o -f xdebug-3.1.5 \
  && docker-php-ext-configure gd --with-jpeg --with-freetype \
  && docker-php-ext-configure zip \
  && docker-php-ext-configure bcmath \
  && docker-php-ext-install gd pdo pdo_mysql opcache mysqli zip bcmath mbstring exif \
  && docker-php-ext-enable xdebug opcache rdkafka redis imagick mbstring exif  && rm -rf /tmp/pear \
  && php -r "copy('https://install.phpcomposer.com/installer', 'composer-setup.php');" \
  && php composer-setup.php && php -r "unlink('composer-setup.php');" \
  && mv composer.phar /usr/local/bin/composer && chmod +x /usr/local/bin/composer

COPY ./xdebug.ini /tmp/xdebug.ini

RUN cat /tmp/xdebug.ini >> /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini

RUN mkdir -p /tmp/zzmed/sql && chmod -R 777 /tmp/zzmed

WORKDIR /var/www
