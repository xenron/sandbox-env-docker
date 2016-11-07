#!/bin/bash
# This is the base process of the container.

init()
{
	# Setup HDFS
	chown hdfs:hadoop /var/lib/hadoop-hdfs/cache/
	rm -Rf /var/lib/hadoop-hdfs/cache/*
	sudo -u hdfs hdfs namenode -format

	# Setup zookeeper
	chown zookeeper:zookeeper /var/lib/zookeeper/
	service zookeeper-server init

	service mysql start

	mysql -e "CREATE DATABASE metastore;"
	mysql -e "USE metastore; SOURCE /usr/lib/hive/scripts/metastore/upgrade/mysql/hive-schema-0.14.0.mysql.sql;"
	mysql -e "CREATE USER 'hive'@'localhost' IDENTIFIED BY 'mypassword';"
 	mysql -e "REVOKE ALL PRIVILEGES, GRANT OPTION FROM 'hive'@'localhost';"
        mysql -e "GRANT SELECT,INSERT,UPDATE,DELETE,LOCK TABLES,EXECUTE ON metastore.* TO 'hive'@'localhost';"
	mysql -e "FLUSH PRIVILEGES;"
}


# Initalize the container
init_container()
{
	init
	start_container
}


# Start hadoop and tail logs to keep PID 1 going.
start_container() 
{
	start_hadoop
	sleep 5
	tail -f /var/log/hadoop-*/*.out
}


# Start the tomcat service
start_hadoop() 
{
	# Start the SSH service 
	echo -e "\n---- Launching SSH ----\n"
	service ssh start

	# Start the HDFS service 
	echo -e "\n---- Luanching HDFS ----\n"
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
	service zookeeper-server start

	# Start the mysql database
        service mysql start

	# Start the Hive service
	echo -e "\n---- Luanching Hive ----\n"
	/usr/bin/hive --service metastore&

	# Start the Yarn service 
	echo -e "\n---- Luanching Yarn ----\n"
	service hadoop-yarn-resourcemanager start
	service hadoop-yarn-nodemanager start
	service hadoop-mapreduce-historyserver start

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

	echo -e "\n---- Startup Complete ----\n"
}


# Stop the tomcat service
stop_hadoop() 
{
	service hadoop-hdfs-namenode stop
	service hadoop-hdfs-datanode stop

	service zookeeper-server stop

#	${HIVE_HOME}/bin/hive --service metastore&

	service hadoop-yarn-resourcemanager stop
	service hadoop-yarn-nodemanager stop
	service hadoop-mapreduce-historyserver stop

	service oozie stop
	
	service spark-history-server stop

	service hue stop
}




# Startup the container
if [ -z $1 ] || [ "$1" == "run" ]; then
	start_container
fi

# Initalize the container
if [ "$1" == "init" ]; then 
	init_container
fi

# Start hadoop
if [ "$1" == "start" ]; then 
	start_hadoop
fi

# Stop hadoop
if [ "$1" == "stop" ]; then 
	stop_hadoop
fi

# Restart hadoop
if [ "$1" == "restart" ]; then 
	stop_hadoop
	sleep 2
	start_hadoop
fi

