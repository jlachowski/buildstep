FROM ubuntu:trusty
MAINTAINER jlachowski "jalachowski@gmail.com"

RUN mkdir /build
ADD ./stack/ /build
#RUN sed -i s/archive/old-releases/g /etc/apt/sources.list
RUN LC_ALL=C DEBIAN_FRONTEND=noninteractive /build/prepare
RUN rm -rf /var/lib/apt/lists/*
RUN apt-get clean

# Set locale
RUN DEBIAN_FRONTEND=noninteractive locale-gen --no-purge pl_PL.UTF-8
ENV LC_ALL pl_PL.UTF-8
RUN DEBIAN_FRONTEND=noninteractive dpkg-reconfigure locales
