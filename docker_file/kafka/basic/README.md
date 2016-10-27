
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

