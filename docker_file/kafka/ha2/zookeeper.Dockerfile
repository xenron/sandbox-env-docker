version: '2.0'
services:
  zookeeper0:
    build:
      context: .
      dockerfile: zookeeper.Dockerfile
    image: jason/zookeeper:3.4.6
    container_name: zookeeper0
    hostname: zookeeper0
    ports:
      - "2181:2181"
      - "2888:2888"
      - "3888:3888"
    expose:
      - 2181
      - 2888
      - 3888
    environment:
      ZOOKEEPER_PORT: 2181
      ZOOKEEPER_ID: 0
      ZOOKEEPER_SERVERS: server.0=zookeeper0:2888:3888 server.1=zookeeper1:28881:38881 server.2=zookeeper2:28882:38882
  zookeeper1:
    build:
      context: .
      dockerfile: zookeeper.Dockerfile
    image: jason/zookeeper:3.4.6
    container_name: zookeeper1
    hostname: zookeeper1
    ports:
      - "2182:2182"
      - "28881:28881"
      - "38881:38881"
    expose:
      - 2182
      - 2888
      - 3888
    environment:
      ZOOKEEPER_PORT: 2182
      ZOOKEEPER_ID: 1
      ZOOKEEPER_SERVERS: server.0=zookeeper0:2888:3888 server.1=zookeeper1:28881:38881 server.2=zookeeper2:28882:38882
#    depends_on:
#      - zookeeper0
  zookeeper2:
    build:
      context: .
      dockerfile: zookeeper.Dockerfile
    image: jason/zookeeper:3.4.6
    container_name: zookeeper2
    hostname: zookeeper2
    ports:
      - "2183:2183"
      - "28882:28882"
      - "38882:38882"
    expose:
      - 2183
      - 2888
      - 3888
    environment:
      ZOOKEEPER_PORT: 2183
      ZOOKEEPER_ID: 2
      ZOOKEEPER_SERVERS: server.0=zookeeper0:2888:3888 server.1=zookeeper1:28881:38881 server.2=zookeeper2:28882:38882