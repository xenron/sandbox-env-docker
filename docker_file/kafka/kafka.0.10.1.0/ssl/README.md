

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
# ./bin/kafka-topics.sh --zookeeper zookeeper0:12181/kafka,zookeeper1:12182/kafka,zookeeper2:12183/kafka --topic test1 --replication-factor 2 --partitions 3 --create
./bin/kafka-topics.sh --zookeeper zookeeper0:12181/kafka --topic test1 --replication-factor 2 --partitions 3 --create

# list topic
# ./bin/kafka-topics.sh --zookeeper zookeeper0:12181/kafka,zookeeper1:12182/kafka,zookeeper2:12183/kafka --list
./bin/kafka-topics.sh --zookeeper zookeeper0:12181/kafka --list

# producer console
./bin/kafka-console-producer.sh --broker-list kafka0:19092,kafka1:19093,kafka2:19094 --topic test1

# consumer console
# ./bin/kafka-console-consumer.sh --zookeeper zookeeper0:12181/kafka,zookeeper1:12182/kafka,zookeeper2:12183/kafka --topic test1 --from-beginning
./bin/kafka-console-consumer.sh --bootstrap-server kafka0:19092 --topic test1 --new-consumer
./bin/kafka-console-consumer.sh --bootstrap-server kafka1:19093 --topic test1 --new-consumer
```

ZOOKEEPER_CONNECT: zookeeper0:12181,zookeeper1:12182,zookeeper2:12183/kafka
BROKER_ID: 0
LISTENERS: PLAINTEXT://kafka0:19092,SSL://kafka0:29092
ZOOKEEPER_SESSION_TIMEOUT: 3600000
CONNECT_REST_PORT: 18083


