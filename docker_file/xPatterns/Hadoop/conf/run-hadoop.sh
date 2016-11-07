#!/bin/bash

# Start the SSH service 

echo -e "\n---- Launching SSH ----\n"
service ssh start


# Start the HDFS service 
echo -e "\n---- Luanching HDFS ----\n"
chown hdfs:hadoop /var/lib/hadoop-hdfs/cache/
rm -Rf /var/lib/hadoop-hdfs/cache/*
sudo -u hdfs hdfs namenode -format
service hadoop-hdfs-namenode start
service hadoop-hdfs-datanode start

sudo -u hdfs hadoop fs -mkdir -p /tmp/hadoop-yarn/staging/history/done_intermediate
sudo -u hdfs hadoop fs -chown -R mapred:mapred /tmp/hadoop-yarn/staging
sudo -u hdfs hadoop fs -chmod -R 1777 /tmp
sudo -u hdfs hadoop fs -mkdir -p /var/log/hadoop-yarn
sudo -u hdfs hadoop fs -chown yarn:mapred /var/log/hadoop-yarn
sudo -u hdfs hdfs dfs -mkdir /user
sudo -u hdfs hdfs dfs -mkdir /user/hive
sudo -u hdfs hdfs dfs -mkdir /user/hive/warehouse
sudo -u hdfs hdfs dfs -chmod -R 777 /user/hive/warehouse 
sudo -u hdfs hdfs dfs -chmod -R 777 /


# Start the Zookeeper service 
echo -e "\n---- Luanching Zookeeper ----\n"
chown -R zookeeper:zookeeper /var/lib/zookeeper
service zookeeper-server init
service zookeeper-server start


# Start the Hive service
echo -e "\n---- Luanching Hive ----\n"
${HIVE_HOME}/bin/hive --service metastore&


# Start the Yarn service 
echo -e "\n---- Luanching Yarn ----\n"
service hadoop-yarn-resourcemanager start
service hadoop-yarn-nodemanager start
service hadoop-mapreduce-historyserver start

sudo -u hdfs hadoop fs -mkdir -p /user/hdfs
sudo -u hdfs hadoop fs -chown hdfs /user/hdfs


# Start the oozie service 
echo -e "\n---- Luanching Oozie ----\n"
sudo -u hdfs hadoop fs -mkdir /user/oozie
sudo -u hdfs hadoop fs -chown oozie:oozie /user/oozie
sudo oozie-setup sharelib create -fs hdfs://localhost:8020 -locallib /usr/lib/oozie/oozie-sharelib-yarn
sudo -u oozie /usr/lib/oozie/bin/ooziedb.sh create -sqlfile /tmp/oozie.sql -run

service oozie start


# Starting the Spark History service
echo -e "\n---- Luanching Spark History Server ----\n"
sudo -u hdfs hadoop fs -mkdir /user/spark
sudo -u hdfs hadoop fs -mkdir /user/spark/applicationHistory
sudo -u hdfs hadoop fs -chown -R spark:spark /user/spark
sudo -u hdfs hadoop fs -chmod 1777 /user/spark/applicationHistory

#init spark shared libraries
#client than can use SPARK_JAR=hdfs://<nn>:<port>/user/spark/share/lib/spark-assembly.jar
sudo -u spark hadoop fs -mkdir -p /user/spark/share/lib 
sudo -u spark hadoop fs -put /usr/lib/spark/lib/spark-assembly.jar /user/spark/share/lib/spark-assembly.jar
service spark-history-server start


# Start the Hue service 
echo -e "\n---- Luanching Hue ----\n"
service hue start


# Finish up
echo -e "\n---- Startup Complete ----\n"
sleep 1
tail -n 1000 -f /var/log/hadoop-*/*.out
