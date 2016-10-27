docker build -t dajobe/hbase -f hbase-volumn.Dockerfile .
docker run --name=hbase-docker -h hbase-docker -d dajobe/hbase


