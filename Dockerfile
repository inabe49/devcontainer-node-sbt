FROM ubuntu:20.04

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
        && apt-get install -y nodejs \
        && apt-get clean \
        && rm -rf /var/lib/apt/lists/*

# Install SBT
RUN set -x \
apt-get update \
        && apt-get install apt-transport-https curl gnupg -yqq \
        && echo "deb https://repo.scala-sbt.org/scalasbt/debian all main" | tee /etc/apt/sources.list.d/sbt.list \
        && echo "deb https://repo.scala-sbt.org/scalasbt/debian /" | tee /etc/apt/sources.list.d/sbt_old.list \
        && curl -sL "https://keyserver.ubuntu.com/pks/lookup?op=get&search=0x2EE0EA64E40A89B84B2DF73499E82A75642AC823" | gpg --no-default-keyring --keyring gnupg-ring:/etc/apt/trusted.gpg.d/scalasbt-release.gpg --import \
        && chmod 644 /etc/apt/trusted.gpg.d/scalasbt-release.gpg \
        && apt-get update \
        && apt-get install sbt \
        && apt-get clean -y \
        && rm -rf /var/lib/apt/lists/*
