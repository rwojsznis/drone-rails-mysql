FROM ruby:2.5.3-alpine

ENV DOCKERIZE_VERSION 0.6.1

RUN apk --no-cache --update --virtual add \
    build-dependencies \
    build-base \
    gcc \
    wget \
    git \
    chromium-chromedriver \
    xvfb \
    ttf-freefont \
    mysql-client \
    imagemagick && \
    wget -q https://github.com/jwilder/dockerize/releases/download/v$DOCKERIZE_VERSION/dockerize-alpine-linux-amd64-v$DOCKERIZE_VERSION.tar.gz && tar -C /usr/local/bin -xzvf dockerize-alpine-linux-amd64-v$DOCKERIZE_VERSION.tar.gz && rm dockerize-alpine-linux-amd64-v$DOCKERIZE_VERSION.tar.gz
