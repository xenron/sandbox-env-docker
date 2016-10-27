
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

