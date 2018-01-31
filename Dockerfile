FROM ruby:2.4.3

ENV PHANTOM_VERSION 2.1.3
ENV DOCKERIZE_VERSION 0.6.0

RUN echo 'gem: --no-rdoc --no-ri' >> "$HOME/.gemrc"

RUN apt-get update && \
    apt-get install -y build-essential \
    libfreetype6 \
    libfontconfig1 \
    mysql-client nodejs && \
    rm -rf /var/lib/apt/lists/* && \
    wget -q -P /usr/local/bin/ https://github.com/ariya/phantomjs/releases/download/$PHANTOM_VERSION/phantomjs && \
    chmod +x /usr/local/bin/phantomjs && \
    wget -q https://github.com/jwilder/dockerize/releases/download/v$DOCKERIZE_VERSION/dockerize-linux-amd64-v$DOCKERIZE_VERSION.tar.gz && tar -C /usr/local/bin -xzvf dockerize-linux-amd64-v$DOCKERIZE_VERSION.tar.gz && rm dockerize-linux-amd64-v$DOCKERIZE_VERSION.tar.gz
