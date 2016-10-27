```bash
docker build -t xenron/hbase -f Dockerfile .
docker run --name=hbase-docker -h hbase-docker -d xenron/hbase
docker exec -it hbase-docker bash
```
```bash
# HBase Test
hbase(main):001:0> create 'member','member_id','address','info'
hbase(main):002:0> list
hbase(main):003:0> describe 'member'
hbase(main):003:0> exit
```
```bash
# clean up
docker stop $(docker ps -aq)
docker rm $(docker ps -aq)
```

