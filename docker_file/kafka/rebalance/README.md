
# Kafka Rebalance

```bash
docker-compose -f docker-compose.yml stop
docker-compose -f docker-compose.yml rm -f
docker-compose -f docker-compose.yml build
docker-compose -f docker-compose.yml up -d
# test
docker-compose -f docker-compose-test.yml stop
docker-compose -f docker-compose-test.yml rm -f
docker-compose -f docker-compose-test.yml build
docker-compose -f docker-compose-test.yml up -d
```

```
Creating test0
Creating zookeeper0
Creating zookeeper1
Creating zookeeper2
Creating kafka0
Creating kafka1
Creating kafka2
```

docker network ls

docker exec -it kafka0 bash
docker exec -it zookeeper0 bash

# docker build -t="xenron/java" -f java.Dockerfile .
# docker build -t xenron/java -f java.Dockerfile .
# docker run --network=rebalance_default -itd --name=java -h java xenron/java bash
# docker exec -it java bash

docker exec -it kafka0 bash
source /root/.bash_profile
cd /opt/kafka/kafka_2.11-0.8.2.2
./bin/kafka-topics.sh --zookeeper zookeeper0:2181/kafka --create --topic topic1 --partitions 3 --replication-factor 1
./bin/kafka-topics.sh --zookeeper zookeeper0:2181/kafka --describe --topic topic1
./bin/kafka-console-producer.sh --broker-list kafka0:9092 --topic topic1

mvn clean compile
mvn package -DparamFinalName=kafka_consumer
mvn package -DparamFinalName=kafka_producer

java -jar kafka_consumer.jar zookeeper0:2181/kafka topic1 group1 consumer1
java -jar kafka_consumer.jar zookeeper0:2181/kafka topic1 group1 consumer2
java -jar kafka_consumer.jar zookeeper0:2181/kafka topic1 group1 consumer3

java -jar kafka_consumer.jar zookeeper0:2181/kafka topic1 group2 consumer1

java -jar kafka_producer.jar

