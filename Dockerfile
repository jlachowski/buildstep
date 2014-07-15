FROM ubuntu:quantal
MAINTAINER progrium "progrium@gmail.com"

RUN mkdir /build
ADD ./stack/ /build
RUN sed -i s/archive/old-releases/g /etc/apt/sources.list
RUN LC_ALL=C DEBIAN_FRONTEND=noninteractive /build/prepare
RUN rm -rf /var/lib/apt/lists/*
RUN apt-get clean

# Set locale
RUN locale-gen --no-purge pl_PL.UTF-8
ENV LC_ALL pl_PL.UTF-8
RUN dpkg-reconfigure locales
