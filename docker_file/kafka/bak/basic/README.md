
# Kafka Basic
build image
```bash
docker build -t jason/zookeeper:3.4.9 -f zookeeper.Dockerfile .
docker build -t jason/kafka:0.8.2.2 -f kafka.Dockerfile .
```
test
```bash
docker run -itd --name zookeeper -h zookeeper -p2181:2181 jason/zookeeper:3.4.9 bash
docker run -itd --name kafka -h kafka -p9092:9092 --link zookeeper jason/kafka:0.8.2.2 bash
```


# Kafka Simple Test
```bash
# start container
docker run -itd --name zookeeper -h zookeeper -p2181:2181 jason/zookeeper:3.4.9 bash
docker run -itd --name kafka -h kafka -p9092:9092 --link zookeeper jason/kafka:0.8.2.2 bash

docker exec -it kafka bash
source /root/.bash_profile
cd /opt/kafka/kafka_2.11-0.8.2.2
./bin/kafka-topics.sh --zookeeper zookeeper:2181 --create --topic test1 --partitions 3 --replication-factor 1
./bin/kafka-topics.sh --zookeeper zookeeper:2181 --describe --topic test1
./bin/kafka-console-producer.sh --broker-list localhost:9092 --topic test1
# input serval string
./bin/kafka-console-consumer.sh --zookeeper zookeeper:2181 --topic test1 --from-beginning
```

