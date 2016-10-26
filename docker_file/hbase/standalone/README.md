docker build -t xenron/hbase -f hbase-standalone.Dockerfile .
docker run --name=hbase-docker -h hbase-docker -d xenron/hbase

