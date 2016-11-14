
# Kafka Rebalance

docker-compose stop
docker-compose rm -f
docker-compose build
docker-compose up -d



docker exec -it kafka0 bash
docker exec -it zookeeper0 bash


docker network ls

docker build -t="xenron/java" -f java.Dockerfile .
docker build -t xenron/java -f java.Dockerfile .

docker run --network=rebalance_default -itd --name=java -h java xenron/java bash
docker exec -it java bash





