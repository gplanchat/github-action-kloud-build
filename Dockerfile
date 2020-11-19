FROM php:7.4-cli-alpine

LABEL maintainer="Grégory Planchat <gregory@kiboko.fr>"

RUN set -ex\
    && apk update \
    && apk upgrade \
    && apk add \
        wget \
        ca-certificates \
        git \
        nodejs \
        npm \
        docker \
        openssh \
    && update-ca-certificates \
    && apk add --virtual .build-deps \
        autoconf \
        bash \
        binutils \
        expat \
        file \
        g++ \
        gcc \
        m4 \
        make \
    && docker-php-ext-install opcache \
    && apk add --update icu-dev icu \
    && docker-php-ext-configure intl \
    && docker-php-ext-install intl \
    && docker-php-ext-configure pcntl \
    && docker-php-ext-install pcntl \
    && apk del icu-dev \
    && apk add gnu-libiconv --update-cache --repository http://dl-cdn.alpinelinux.org/alpine/edge/community/ --allow-untrusted \
    && apk del \
        .build-deps \
        gdbm \
        gmp \
        isl \
        libatomic \
        libbz2 \
        libc-dev \
        libffi \
        libgomp \
        libltdl \
        libtool \
        mpc1 \
        musl-dev \
        perl \
        pkgconf \
        pkgconfig \
        python3 \
        re2c \
        readline \
        sqlite-libs \
    && rm -rf /tmp/* /var/cache/apk/*

ENV LD_PRELOAD /usr/lib/preloadable_libiconv.so php

# Copies your code file from your action repository to the filesystem path `/` of the container
COPY entrypoint.sh /entrypoint.sh

# Code file to execute when the docker container starts up (`entrypoint.sh`)
ENTRYPOINT ["/entrypoint.sh"]
