# HBase Standalone

store data to local file system (NO HDFS)

```bash
# Ubuntu 14.04
docker build -t xenron/hbase -f ubuntu_14.04.Dockerfile .
# Ubuntu 16.04
docker build -t xenron/hbase -f ubuntu_16.04.Dockerfile .

# start container
docker run --name=hbase-docker -h hbase-docker -d xenron/hbase

# go into container
docker exec -it hbase-docker bash
# hbase shell
```

```bash
# HBase Simple Test
hbase(main):001:0> create 'member','member_id','address','info'
hbase(main):002:0> list
hbase(main):003:0> describe 'member'
hbase(main):004:0> exit
```

```bash
# clean up
docker stop $(docker ps -aq)
docker rm $(docker ps -aq)
```

