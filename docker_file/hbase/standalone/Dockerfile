# HBase in Docker
#
# Version 0.3

# http://docs.docker.io/en/latest/use/builder/


FROM ubuntu:xenial
MAINTAINER Dave Beckett <dave@dajobe.org>

ENV HBASE_DIST "http://archive.apache.org/dist/hbase"
ENV HBASE_VERSION 1.1.6
ENV JAVA_HOME "/usr/lib/jvm/java-8-openjdk-amd64"

RUN apt-get update -y && \
    apt-get install -y --no-install-recommends curl && \
    apt-get install -y openjdk-8-jre-headless && \
    update-alternatives --config java && \
    rm -rf /var/lib/apt/lists/*

WORKDIR /opt/

RUN curl -SL $HBASE_DIST/$HBASE_VERSION/hbase-$HBASE_VERSION-bin.tar.gz | tar -x -z && \
    mv hbase-${HBASE_VERSION} hbase

WORKDIR /opt/hbase/

# here=$(pwd)

# delete files that are not needed to run hbase
# rm -rf docs *.txt LEGAL
# rm -f */*.cmd

# Set Java home for hbase servers
RUN sed -i "s,^. export JAVA_HOME.*,export JAVA_HOME=$JAVA_HOME," conf/hbase-env.sh

# Set interactive shell defaults
#RUN cat > /etc/profile.d/defaults.sh <<EOF \
#    JAVA_HOME=$JAVA_HOME \
#    export JAVA_HOME \
#    EOF
RUN echo "JAVA_HOME=$JAVA_HOME \
    export JAVA_HOME" >> /etc/profile.d/defaults.sh

RUN cd /usr/bin && \
    ln -sf /opt/hbase/bin/* .

# RUN apt-get remove --purge -y curl apt-mark showauto

# . /build/cleanup.sh
# rm -rf /tmp/* /var/tmp/*

# apt-get clean
# rm -rf /var/lib/apt/lists/*

RUN mkdir /data/

ADD ./hbase-site.xml /opt/hbase/conf/hbase-site.xml

ADD ./zoo.cfg /opt/hbase/conf/zoo.cfg

ADD ./hbase-server /opt/hbase-server

# REST API
EXPOSE 8080
# REST Web UI at :8085/rest.jsp
EXPOSE 8085
# Thrift API
EXPOSE 9090
# Thrift Web UI at :9095/thrift.jsp
EXPOSE 9095
# HBase's Embedded zookeeper cluster
EXPOSE 2181
# HBase Master web UI at :16010/master-status;  ZK at :16010/zk.jsp
EXPOSE 16010

CMD ["/opt/hbase-server"]
# ENTRYPOINT ["sh", "/opt/hbase-server"]

