docker pull krejcmat/hadoop-hbase-master:latest
docker pull krejcmat/hadoop-hbase-slave:latest

bash start-container.sh latest 2
# in container
bash start-hbase.sh
