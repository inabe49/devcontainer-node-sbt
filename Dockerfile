FROM ubuntu:28.04

LABEL maintainer "Toshiaki Inahata <darwin49@gmail.com>"

# Install Japanese
RUN set -x \
        && apt-get update \
        && apt-get upgrade -y \
        && apt-get install -y language-pack-ja \
        && locale-gen ja_JP.UTF-8 \
        && apt-get clean \
        && rm -rf /var/lib/apt/lists/*

ENV LANG ja_JP.UTF-8
ENV LANGUAGE ja_JP:ja
ENV LC_ALL ja_JP.UTF-8

# Install JDK
RUN set -x \
        && apt-get update \
        && apt-get upgrade -y \
        && apt-get install -y openjdk-11-jdk \
        && apt-get clean \
        && rm -rf /var/lib/apt/lists/*

# Install Node.js
# https://github.com/nodesource/distributions/blob/master/README.md
RUN set -x \
        && apt-get update \
        && curl -fsSL https://deb.nodesource.com/setup_16.x | -E bash - \
        && apt-get install -y nodejs
        && apt-get clean \
        && rm -rf /var/lib/apt/lists/*
