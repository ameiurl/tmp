FROM php:7.4-fpm

ENV TZ=Asia/Shanghai
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

RUN echo "deb http://mirrors.aliyun.com/debian/ buster main non-free contrib \n \
		deb-src http://mirrors.aliyun.com/debian/ buster main non-free contrib \n \
		deb http://mirrors.aliyun.com/debian-security buster/updates main \n \
		deb-src http://mirrors.aliyun.com/debian-security buster/updates main \n \
		deb http://mirrors.aliyun.com/debian/ buster-updates main non-free contrib \n \
		deb-src http://mirrors.aliyun.com/debian/ buster-updates main non-free contrib \n \
		deb http://mirrors.aliyun.com/debian/ buster-backports main non-free contrib \n \
		deb-src http://mirrors.aliyun.com/debian/ buster-backports main non-free contrib" > /etc/apt/sources.list \
		&& apt-get update \
		&& apt-get install -y \
		build-essential \
		libmagickcore-dev \
		libmagickwand-dev \
		imagemagick \
		libfreetype6-dev \
		libjpeg62-turbo-dev \
		libmcrypt-dev \
		libpng-dev \
		libmemcached-dev \
		zlib1g-dev \
		curl \
		libcurl4-gnutls-dev \
		libzip-dev \
		libicu-dev \
		g++ \
		&& docker-php-ext-configure gd --with-freetype --with-jpeg \
		&& docker-php-ext-configure intl \
		&& docker-php-ext-install -j$(nproc) gd zip iconv pdo_mysql opcache mysqli bcmath intl \
		&& pecl install redis-5.1.1 && docker-php-ext-enable redis \
		&& pecl install imagick && docker-php-ext-enable imagick \
		&& pecl install mcrypt && docker-php-ext-enable mcrypt \
		&& pecl install memcached && docker-php-ext-enable memcached \
		&& pecl install msgpack && docker-php-ext-enable msgpack \
		&& pecl install yar && docker-php-ext-enable yar \
		&& pecl install yaml && docker-php-ext-enable yaml \
		&& pecl install xdebug && docker-php-ext-enable xdebug
