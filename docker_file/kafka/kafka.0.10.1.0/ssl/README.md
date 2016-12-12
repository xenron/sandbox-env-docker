

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
docker rmi jason/kafka-manager:1.0
```


```bash
source /root/.bash_profile

# create topic
./bin/kafka-topics.sh -zookeeper zookeeper0:2181,zookeeper1:2182,zookeeper2:2183 -topic test1 -replication-factor 2 -partitions 3 -create

# list topic
./bin/kafka-topics.sh -zookeeper zookeeper0:2181,zookeeper1:2182,zookeeper2:2183 -list

# producer console
./bin/kafka-console-producer.sh -broker-list kafka0:9092,kafka1:9093,kafka2:9094 -topic test1

# consumer console
./bin/kafka-console-consumer.sh -zookeeper zookeeper0:2181,zookeeper1:2182,zookeeper2:2183 - from-begining -topic test1
```

ZOOKEEPER_CONNECT: zookeeper0:12181,zookeeper1:12182,zookeeper2:12183/kafka
BROKER_ID: 0
LISTENERS: PLAINTEXT://kafka0:19092,SSL://kafka0:29092
ZOOKEEPER_SESSION_TIMEOUT: 3600000
CONNECT_REST_PORT: 18083

