
# 构建镜像

```bash
# 构建基本操作系统和OpenJDK环境，包含CentOS 6和OpenJDK 8
docker-compose -f docker-compose-build-all.yml build os-jvm
# 构建Hadoop环境，包含Hadoop 2.7.2，并已启用SSHD服务
docker-compose -f docker-compose-build-all.yml build hadoop
# 构建Hive环境，包含Hive 1.1.1，同时依赖于MySQL 5.7
docker-compose -f docker-compose-build-all.yml build hive
# 构建Spark环境，包含Spark 1.6.2
docker-compose -f docker-compose-build-all.yml build spark
# 构建HBase环境，包含HBase 1.2.2
docker-compose -f docker-compose-build-all.yml build hbase
```

# Hadoop集群

```bash
# 启动容器
docker-compose -f docker-compose-hadoop.yml up -d

# 第一次启动集群时，需要格式化namenode
docker-compose -f docker-compose-hadoop.yml exec hadoop-master hdfs namenode -format

# 启动集群进程
# 启动HDFS
docker-compose -f docker-compose-hadoop.yml exec hadoop-master start-dfs.sh
# 启动YARN
docker-compose -f docker-compose-hadoop.yml exec hadoop-master start-yarn.sh

# 停止Hadoop集群
# 停止YARN
docker-compose -f docker-compose-hadoop.yml exec hadoop-master stop-yarn.sh
# 停止HDFS
docker-compose -f docker-compose-hadoop.yml exec hadoop-master stop-dfs.sh

# stop container
docker-compose -f docker-compose-hadoop.yml stop
# delete container
docker-compose -f docker-compose-hadoop.yml rm
```


# Hive集群

```bash
# 启动容器
docker-compose -f docker-compose-hive.yml up -d

# 第一次启动集群时，需要格式化namenode
docker-compose -f docker-compose-hive.yml exec hive-master hdfs namenode -format

# 启动集群进程
# 启动HDFS
docker-compose -f docker-compose-hive.yml exec hive-master start-dfs.sh
# 启动YARN
docker-compose -f docker-compose-hive.yml exec hive-master start-yarn.sh

# 停止Hadoop集群
# 停止YARN
docker-compose -f docker-compose-hive.yml exec hive-master stop-yarn.sh
# 停止HDFS
docker-compose -f docker-compose-hive.yml exec hive-master stop-dfs.sh

# stop container
docker-compose -f docker-compose-hive.yml stop
# delete container
docker-compose -f docker-compose-hive.yml rm
```

# Spark集群

```bash
# 启动容器
docker-compose -f docker-compose-spark.yml up -d

# 启动HDFS
docker-compose -f docker-compose-spark.yml exec spark-master start-dfs.sh
# 启动YARN
docker-compose -f docker-compose-spark.yml exec spark-master start-yarn.sh
# 启动Spark
docker-compose -f docker-compose-spark.yml exec spark-master start-all.sh

# 停止Spark
docker-compose -f docker-compose-spark.yml exec spark-master stop-all.sh
# 停止YARN
docker-compose -f docker-compose-spark.yml exec spark-master stop-yarn.sh
# 停止HDFS
docker-compose -f docker-compose-spark.yml exec spark-master stop-dfs.sh

# 停止容器
docker-compose -f docker-compose-spark.yml stop
```

# HBase集群

```bash
# 创建集群专用网络，名为hadoop-docker
docker network create hadoop-docker

# 启动容器：
docker-compose -f docker-compose-hbase.yml up -d
# 第一次启动集群时，需要格式化namenode
docker-compose -f docker-compose-hbase.yml exec hbase-master hdfs namenode -format

# 启动集群进程，依次执行：
# 启动HDFS
docker-compose -f docker-compose-hbase.yml exec hbase-master start-dfs.sh
# 启动HBase
docker-compose -f docker-compose-hbase.yml exec hbase-master start-hbase.sh
# 启动YARN
docker-compose -f docker-compose-hbase.yml exec hbase-master start-yarn.sh
# 启动Spark
docker-compose -f docker-compose-spark.yml exec spark-master start-all.sh

# 停止HBase集群：
# 停止SPARK
docker-compose -f docker-compose-hbase.yml exec hbase-master stop-all.sh
# 停止HBase
docker-compose -f docker-compose-hbase.yml exec hbase-master stop-hbase.sh
# 停止YARN
docker-compose -f docker-compose-hbase.yml exec hbase-master stop-yarn.sh
# 停止HDFS
docker-compose -f docker-compose-hbase.yml exec hbase-master stop-dfs.sh
# 停止容器
docker-compose -f docker-compose-hbase.yml stop
```
