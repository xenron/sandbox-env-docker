
# Kafka Rebalance

docker-compose stop
docker-compose rm -f
docker-compose build
docker-compose up -d

```
Creating test0
Creating zookeeper0
Creating zookeeper1
Creating zookeeper2
Creating kafka0
Creating kafka1
Creating kafka2
```

docker exec -it kafka0 bash
docker exec -it zookeeper0 bash

docker network ls

# docker build -t="xenron/java" -f java.Dockerfile .
# docker build -t xenron/java -f java.Dockerfile .
# docker run --network=rebalance_default -itd --name=java -h java xenron/java bash
# docker exec -it java bash

mvn clean compile
mvn package -DparamFinalName=consumer

java -jar kafka_consumer.jar zookeeper0:2181/kafka topic1 group1 consumer1
java -jar kafka_consumer.jar zookeeper0:2181/kafka topic1 group1 consumer2
java -jar kafka_consumer.jar zookeeper0:2181/kafka topic1 group1 consumer3

java -jar kafka_consumer.jar zookeeper0:2181/kafka topic1 group1 consumer1
