
bzip2 -d -c < kafka.0.8.2.2.tar.bz2 | docker load
bzip2 -d -c < zookeeper.3.4.6.tar.bz2 | docker load

# Build images & Start up
```bash
docker-compose build
docker-compose up -d
```

# Clean up
```bash
docker-compose stop
docker-compose rm -f
docker rmi jason/kafka:0.10.1.0
docker rmi jason/zookeeper:3.4.8
```


```bash
source /root/.bash_profile

# create topic
./bin/kafka-topics.sh --zookeeper zookeeper0:2181,zookeeper1:2182,zookeeper2:2183 --topic test1 --replication-factor 2 --partitions 3 --create

# list topic
./bin/kafka-topics.sh --zookeeper zookeeper0:2181,zookeeper1:2182,zookeeper2:2183 --list

# producer console
./bin/kafka-console-producer.sh --broker-list kafka0:9092,kafka1:9093,kafka2:9094 --topic test1

# consumer console
./bin/kafka-console-consumer.sh --zookeeper zookeeper0:2181,zookeeper1:2182,zookeeper2:2183 --topic test1 --from-beginning
```



