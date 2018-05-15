FROM ruby:2.5.1-stretch

ENV PHANTOM_VERSION phantomjs-2.1.1-linux-x86_64
ENV DOCKERIZE_VERSION 0.6.0

RUN echo 'gem: --no-rdoc --no-ri' >> "$HOME/.gemrc"

RUN apt-get update && \
    apt-get install -y build-essential \
    libfreetype6 \
    libfontconfig1 \
    libicu-dev \
    mysql-client nodejs && \
    rm -rf /var/lib/apt/lists/* && \
    wget -q -O - https://bitbucket.org/ariya/phantomjs/downloads/$PHANTOM_VERSION.tar.bz2 | tar xj && \
    mv $PHANTOM_VERSION/bin/phantomjs /usr/local/bin/ && rm -rf $PHANTOM_VERSION/ && \
    wget -q https://github.com/jwilder/dockerize/releases/download/v$DOCKERIZE_VERSION/dockerize-linux-amd64-v$DOCKERIZE_VERSION.tar.gz && tar -C /usr/local/bin -xzvf dockerize-linux-amd64-v$DOCKERIZE_VERSION.tar.gz && rm dockerize-linux-amd64-v$DOCKERIZE_VERSION.tar.gz
