#
# Dockerfile for phpBB
#

FROM php:5.6-apache
MAINTAINER Jeffrey Brite<jeff@c4tech.com>
# I almost did nothing here, most of the credit and blame for this image belongs to kev<noreply@datageek.info>

RUN apt-get update && apt-get install -y curl unzip bzip2 libpq-dev libpng12-dev libjpeg-dev libldap2-dev \
        && rm -rf /var/lib/apt/lists/* \
        && docker-php-ext-configure gd --with-png-dir=/usr --with-jpeg-dir=/usr \
        && docker-php-ext-configure ldap --with-libdir=lib/x86_64-linux-gnu/ \
        && docker-php-ext-install gd mysqli ldap

WORKDIR /var/www/html

ENV PHPBB_VERSION 3.1.6
ENV PHPBB_URL https://www.phpbb.com/files/release/phpBB-${PHPBB_VERSION}.tar.bz2
ENV PHPBB_SHA 95c603151482870f3838e0dd861feae55fcb4d37d40cc238a7193ac8b2845094
ENV PHPBB_FILE phpBB.tar.bz2

RUN curl -fSL ${PHPBB_URL} -o ${PHPBB_FILE} \
        && echo "${PHPBB_SHA} ${PHPBB_FILE}" | sha256sum -c - \
        && tar -xjf ${PHPBB_FILE} --strip-components=1 \
        && rm ${PHPBB_FILE} \
        && chown -R www-data:www-data .

RUN rm -R /var/www/html/install
