# hadoop-docker

```bash
$ ./build-image-root.sh hadoop-dnsmasq
```

```bash
$ ./start-container.sh latest 3
# start master container...
# start slave1 container...
```

```bash
$ serf members
# master.krejcmat.com  172.17.0.2:7946  alive  
# slave1.krejcmat.com  172.17.0.3:7946  alive
$ cd ~
$ ./configure-members.sh
$ ./start-hadoop.sh
$ jps
$ hdfs dfsadmin -report
```



