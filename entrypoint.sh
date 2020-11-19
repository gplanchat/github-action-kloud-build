#!/bin/sh -l

ARGS="--without-dejavu --without-elastic-stack --without-macos-optimizations"

echo "💎 Running Kloud images build"

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

bin/kloud image:build --php-version="$1" --application="$2" --application-version="$3" $ARGS
