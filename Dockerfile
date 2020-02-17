FROM circleci/ruby:2.7.0

ENV DOCKERIZE_VERSION 0.6.1
ENV NODE_VERSION 12.16.0
ENV NVM_DIR /home/circleci/.nvm

RUN mkdir $NVM_DIR \
    && curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.35.2/install.sh | bash \
    && . $NVM_DIR/nvm.sh \
    && nvm install $NODE_VERSION && nvm alias default $NODE_VERSION

USER root

RUN gem update --system && gem install bundler \
    && echo "ttf-mscorefonts-installer msttcorefonts/accepted-mscorefonts-eula select true" | debconf-set-selections \
    && echo "deb http://httpredir.debian.org/debian buster main contrib" > /etc/apt/sources.list \
    && echo "deb http://security.debian.org/ buster/updates main contrib" >> /etc/apt/sources.list \
    && apt-get update \
    && apt-get install --no-install-recommends -y build-essential \
    default-mysql-client ruby-chromedriver-helper xvfb fonts-freefont-ttf ghostscript \
    libfreetype6 libfreetype6-dev libfontconfig ttf-mscorefonts-installer \
    && rm -rf /var/lib/apt/lists/* \
    && wget -q https://github.com/jwilder/dockerize/releases/download/v$DOCKERIZE_VERSION/dockerize-linux-amd64-v$DOCKERIZE_VERSION.tar.gz && tar -C /usr/local/bin -xzvf dockerize-linux-amd64-v$DOCKERIZE_VERSION.tar.gz && rm dockerize-linux-amd64-v$DOCKERIZE_VERSION.tar.gz

USER circleci
