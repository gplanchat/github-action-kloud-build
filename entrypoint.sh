#!/bin/sh -l

PHP_VERSION=$1
APPLICATION=$2
APPLICATION_VERSION=$3
ARGS="--without-dejavu --without-elastic-stack --without-macos-optimizations"

if [ -z "$PHP_VERSION" ]
then
    PHP_VERSION="7.4"
fi

if [ -z "$APPLICATION" ]
then
    APPLICATION="orocommerce"
fi

if [ -z "$APPLICATION_VERSION" ]
then
    APPLICATION_VERSION="4.1"
fi

if [ "$4" = 'enterprise' ]
then
    ARGS="$ARGS --enterprise"
else
    ARGS="$ARGS --community"
fi

if [ "$5" = 'postgresql' ]
then
    ARGS="$ARGS --postgresql"
else
    ARGS="$ARGS --mysql"
fi

if [ "$6" = 1 ]
then
    ARGS="$ARGS --with-xdebug"
else
    ARGS="$ARGS --without-xdebug"
fi

if [ "$7" = 1 ]
then
    ARGS="$ARGS --with-blackfire"
else
    ARGS="$ARGS --without-blackfire"
fi

if [ "$8" = 1 ]
then
    ARGS="$ARGS --push"
fi

echo "🔑 Logging into DockerHub..."

( docker login && echo "🎉 Login Succeeded!" )

echo "💎 Running Kloud images build"

echo bin/kloud image:build --php-version="$PHP_VERSION" --application="$APPLICATION" --application-version="$APPLICATION_VERSION" $ARGS

bin/kloud image:build --php-version="$PHP_VERSION" --application="$APPLICATION" --application-version="$APPLICATION_VERSION" $ARGS
