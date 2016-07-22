FROM java:8u66-jre

RUN curl http://www.apache.org/dist/jmeter/binaries/apache-jmeter-2.13.tgz \
    | tar xz
WORKDIR /apache-jmeter-2.13

EXPOSE 1099
EXPOSE 1100

ENTRYPOINT ["./bin/jmeter", "-j", "/dev/stdout", "-s", \
            "-Dserver_port=1099", "-Jserver.rmi.localport=1100"]
