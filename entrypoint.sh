#!/bin/sh -l

ARGS="--without-dejavu --without-elastic-stack --without-macos-optimizations"

if [ "$4" = 'enterprise' ]
then
    ARGS="$ARGS --enterprise"
else
    ARGS="$ARGS --community"
fi

if [ "$5" = 'postgresql' ]
then
    ARGS="$ARGS --with-blackfire"
else
    ARGS="$ARGS --without-blackfire"
fi

if [ -z "$6" ]
then
    ARGS="$ARGS --with-xdebug"
else
    ARGS="$ARGS --without-xdebug"
fi

if [ -z "$7" ]
then
    ARGS="$ARGS --with-blackfire"
else
    ARGS="$ARGS --without-blackfire"
fi

bin/kloud image:build --php-version="$1" --application="$2" --application-version="$3" $ARGS
