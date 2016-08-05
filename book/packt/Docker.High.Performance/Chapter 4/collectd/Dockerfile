FROM debian:jessie

RUN apt-get update && \
    apt-get --no-install-recommends install -y collectd-core

ADD collectd.conf /etc/collectd/collectd.conf
ENTRYPOINT ["collectd", "-f"]
