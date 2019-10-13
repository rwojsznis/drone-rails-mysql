FROM ruby:2.5.7-stretch

ENV DOCKERIZE_VERSION 0.6.1
ENV NODE_VERSION 10.13.0
ENV NVM_DIR /nvm

RUN mkdir $NVM_DIR \
    && curl -s -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.11/install.sh | bash \
    && . $NVM_DIR/nvm.sh \
    && nvm install $NODE_VERSION && nvm alias default $NODE_VERSION

RUN echo "ttf-mscorefonts-installer msttcorefonts/accepted-mscorefonts-eula select true" | debconf-set-selections \
    && curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - \
    && echo "deb http://httpredir.debian.org/debian stretch main contrib" > /etc/apt/sources.list \
    && echo "deb http://security.debian.org/ stretch/updates main contrib" >> /etc/apt/sources.list \
    && echo "deb http://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list \
    && apt-get update \
    && apt-get install --no-install-recommends -y build-essential \
    mysql-client chromedriver xvfb ttf-freefont ghostscript \
    libfreetype6 libfreetype6-dev libfontconfig ttf-mscorefonts-installer yarn \
    && rm -rf /var/lib/apt/lists/* \
    && wget -q https://github.com/jwilder/dockerize/releases/download/v$DOCKERIZE_VERSION/dockerize-linux-amd64-v$DOCKERIZE_VERSION.tar.gz && tar -C /usr/local/bin -xzvf dockerize-linux-amd64-v$DOCKERIZE_VERSION.tar.gz && rm dockerize-linux-amd64-v$DOCKERIZE_VERSION.tar.gz
