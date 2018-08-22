FROM ruby:2.4.4-jessie

ENV DOCKERIZE_VERSION 0.6.1

RUN echo 'gem: --no-rdoc --no-ri' >> "$HOME/.gemrc"

RUN apt-get update && \
    apt-get install -y build-essential \
    mysql-client nodejs chromedriver xvfb && \
    fonts-ipafont-gothic fonts-wqy-zenhei fonts-thai-tlwg fonts-kacst ttf-freefont && \
    rm -rf /var/lib/apt/lists/* && \
    wget -q https://github.com/jwilder/dockerize/releases/download/v$DOCKERIZE_VERSION/dockerize-linux-amd64-v$DOCKERIZE_VERSION.tar.gz && tar -C /usr/local/bin -xzvf dockerize-linux-amd64-v$DOCKERIZE_VERSION.tar.gz && rm dockerize-linux-amd64-v$DOCKERIZE_VERSION.tar.gz
