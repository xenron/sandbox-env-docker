
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

