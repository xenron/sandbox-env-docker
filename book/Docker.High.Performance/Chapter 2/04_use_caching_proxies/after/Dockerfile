FROM hubuser/debian:jessie

RUN echo 'deb http://httpredir.debian.org/debian jessie-backports main' > /etc/apt/sources.list.d/jessie-backports.list
RUN apt-get update && apt-get install -y --no-install-recommends openjdk-8-jre-headless
