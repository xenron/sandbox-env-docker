FROM xenron/python:python27

MAINTAINER Julien Maupetit <julien@tailordev.fr>

ENV PYTHONUNBUFFERED 1

RUN apt-get update && \
    apt-get install -y --no-install-recommends \
        libatlas-base-dev gfortran

RUN mkdir -p /opt/pandas/build/

COPY requirements-pandas.txt /opt/pandas/build/requirements.txt

RUN pip install -r /opt/pandas/build/requirements.txt

RUN cd /opt/ && \
  git clone https://github.com/taku910/mecab.git && \
  cd mecab/mecab && \
  ./configure --with-charset=utf8 --enable-utf8-only && \
  make && \
  make check && \
  make install && \
  ldconfig

RUN cd /opt/ && \
  wget http://sourceforge.net/projects/mecab/files/mecab-ipadic/2.7.0-20070801/mecab-ipadic-2.7.0-20070801.tar.gz && \
  tar zxvf mecab-ipadic-2.7.0-20070801.tar.gz && \
  cd mecab-ipadic-2.7.0-20070801 && \
  ./configure --with-charset=utf8 && \
  make && \
  make install

RUN cd /opt/ && \
  git clone https://github.com/taku910/cabocha.git && \
  cd cabocha && \
  ./configure --with-charset=utf8 && \
  make && \
  make check && \
  make install


