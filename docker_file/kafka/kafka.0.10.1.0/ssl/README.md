
docker-compose build
docker-compose up -d
docker-compose stop
docker-compose rm -f


ZOOKEEPER_CONNECT: zookeeper0:12181,zookeeper1:12182,zookeeper2:12183/kafka
BROKER_ID: 0
LISTENERS: PLAINTEXT://kafka0:19092,SSL://kafka0:29092
ZOOKEEPER_SESSION_TIMEOUT: 3600000
CONNECT_REST_PORT: 18083

