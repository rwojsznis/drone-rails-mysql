FROM ruby:2.5.3-stretch

ENV DOCKERIZE_VERSION 0.6.1

RUN echo "ttf-mscorefonts-installer msttcorefonts/accepted-mscorefonts-eula select true" | debconf-set-selections \
    && echo "deb http://httpredir.debian.org/debian stretch main contrib" > /etc/apt/sources.list \
    && echo "deb http://security.debian.org/ stretch/updates main contrib" >> /etc/apt/sources.list \
    && apt-get update \
    && apt-get install --no-install-recommends -y build-essential \
    mysql-client nodejs chromedriver xvfb ttf-freefont ghostscript \
    libfreetype6 libfreetype6-dev libfontconfig ttf-mscorefonts-installer \
    && rm -rf /var/lib/apt/lists/* \
    && wget -q https://github.com/jwilder/dockerize/releases/download/v$DOCKERIZE_VERSION/dockerize-linux-amd64-v$DOCKERIZE_VERSION.tar.gz && tar -C /usr/local/bin -xzvf dockerize-linux-amd64-v$DOCKERIZE_VERSION.tar.gz && rm dockerize-linux-amd64-v$DOCKERIZE_VERSION.tar.gz
