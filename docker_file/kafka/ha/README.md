
# Kafka HA

```bash
docker-compose stop
docker-compose rm -f
docker-compose build
docker-compose up -d
```
Service Nodes
```
Creating zookeeper
Creating kafka0
Creating kafka1
Creating kafka2
```

docker network ls

docker exec -it kafka0 bash
docker exec -it zookeeper bash

