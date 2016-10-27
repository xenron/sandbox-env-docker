
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

# Kafka Standalone
build image
```bash
# Default Version Setting
# Java:1.8.0_102
# Scala:2.11
# Kafka=0.8.2.2
docker build -t xenron/kafka_standalone:0.8.2.2 -f kafka.Dockerfile .

# Kafka=0.9.0.0
docker build -t xenron/kafka_standalone:0.9.0.0 --build-arg KafkaVersion=0.9.0.0 -f kafka.Dockerfile .

# Scala:2.10, Kafka=0.9.0.0
docker build -t xenron/kafka_standalone:0.9.0.0 --build-arg ScalaVersion=2.10 --build-arg KafkaVersion=0.9.0.0 -f kafka.Dockerfile .

# Java:1.8.0_101, Scala:2.10, Kafka=0.9.0.0
JavaInfoForDockerBuild=`python get_java_version.py 1.8`
JavaVersionForDockerBuild=${JavaInfoForDockerBuild/|*/}
JavaDownloadForDockerBuild=${JavaInfoForDockerBuild/*|/}
docker build -t xenron/kafka_standalone:0.9.0.0 \
--build-arg JavaVersion=${JavaVersionForDockerBuild} \
--build-arg JavaDownload=${JavaDownloadForDockerBuild} \
--build-arg ScalaVersion=2.11 \
--build-arg KafkaVersion=0.9.0.0 \
-f kafka.Dockerfile .
```
test
```bash
docker run -itd --name zookeeper -h zookeeper -p2181:2181 jason/zookeeper:3.4.9 bash
docker run -itd --name kafka -h kafka -p9092:9092 --link zookeeper jason/kafka:0.8.2.2 bash
```

# Kafka HA
build image
```bash
docker build -t jason/zookeeper:3.4.6 -f zookeeper.Dockerfile .
docker build -t jason/kafka:0.8.2.2 -f kafka.Dockerfile .
```
test
```bash
docker run -itd --name zookeeper -h zookeeper -p2181:2181 jason/zookeeper:3.4.6 bash
docker run -itd --name kafka1 -h kafka1 -p9092:9092 -e BROKER_ID=1 -e BROKER_PORT=9092 --link zookeeper jason/kafka:0.8.2.2 bash
docker run -itd --name kafka2 -h kafka2 -p9093:9093 -e BROKER_ID=2 -e BROKER_PORT=9093 --link zookeeper jason/kafka:0.8.2.2 bash
docker run -itd --name kafka3 -h kafka3 -p9094:9094 -e BROKER_ID=3 -e BROKER_PORT=9094 --link zookeeper jason/kafka:0.8.2.2 bash
```

# Kafka Cluster
```bash
docker-compose up -d
```




