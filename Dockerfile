FROM ruby:2.4.3

ENV PHANTOM_VERSION 2.1.3

RUN echo 'gem: --no-rdoc --no-ri' >> "$HOME/.gemrc"

RUN apt-get update && \
    apt-get install -y build-essential \
    libfreetype6 \
    libfontconfig1 \
    mysql-client nodejs && \
    rm -rf /var/lib/apt/lists/* && \
    wget -q -P /usr/local/bin/ https://github.com/ariya/phantomjs/releases/download/$PHANTOM_VERSION/phantomjs
