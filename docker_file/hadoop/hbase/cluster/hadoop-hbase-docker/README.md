# hadoop-hbase-docker

```bash
cd cluster/hadoop-docker
./build-image-root.sh hadoop-dnsmasq
cd cluster/hadoop-hbase-docker
./build-image-root.sh hadoop-hbase-base
```

# Starting Container
```bash
./start-container-root.sh latest 3
# start master container...
# start slave1 container...

# do it in continer
serf members
# master.krejcmat.com  172.17.0.5:7946  alive  
# slave1.krejcmat.com  172.17.0.6:7946  alive  
# slave2.krejcmat.com  172.17.0.7:7946  alive
cd ~
./configure-members.sh
# Starting Hadoop
./start-hadoop.sh
jps
hdfs dfsadmin -report
```

# Start HBase

```bash
cd ~
./start-hbase.sh
```

```bash
hbase(main):001:0> $ status
hbase(main):002:0> $ create 'album','label','image'
hbase(main):003:0> $ put 'album','label1','label:size','10'
hbase(main):004:0> $ put 'album','label1','label:color','255:255:255'
hbase(main):005:0> $ put 'album','label1','label:text','Family album'
hbase(main):006:0> $ put 'album','label1','image:name','holiday'
hbase(main):007:0> $ put 'album','label1','image:source','/tmp/pic1.jpg'
hbase(main):008:0> $ get 'album','label1'
```
