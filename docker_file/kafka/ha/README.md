
# Kafka HA

docker-compose stop
docker-compose rm -f
docker-compose build
docker-compose up -d

docker network ls

docker exec -it kafka0 bash
docker exec -it zookeeper0 bash
