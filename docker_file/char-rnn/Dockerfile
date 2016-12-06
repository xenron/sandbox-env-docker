FROM ubuntu:14.04
MAINTAINER caffe-maint@googlegroups.com

ENV BASEPATH="/opt"

RUN apt-get update && apt-get install -y --no-install-recommends \
        build-essential \
        cmake \
        git \
        wget \
        vim \
        ssh \
        curl \
        php5-curl \
        software-properties-common \
        libcurl4-openssl-dev && \
    rm -rf /var/lib/apt/lists/*

WORKDIR /opt
