docker build -t xenron/hbase -f Dockerfile .
docker run --name=hbase-docker -h hbase-docker -d xenron/hbase

