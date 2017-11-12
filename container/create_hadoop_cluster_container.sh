#! /bin/bash

echo "该脚本用来创建hadoop容器集群"

echo "删除以下名字的容器"
docker rm -f centos-zk-101 centos-zk-102 centos-zk-103 
docker rm -f centos-nn-101 centos-nn-102
docker rm -f centos-rm-101 centos-rm-102
docker rm -f centos-dn-101 centos-dn-102 centos-dn-103
docker rm -f centos-hue

echo "创建专有的网络"
#docker network rm hadoop-net
#docker network create hadoop-net --subnet 192.168.8.0/16 --gateway 192.168.8.1

echo "创建zookeeper节点"
#docker run --net hadoop-net --name centos-zk-101 --hostname centos-zk-101 --ip 192.168.8.101 -p 12181:2181 -v ~/MyData/BigData-in-practice/container/zk:/var/zookeeper --restart=always -d zhongchzh/centos-zookeeper /var/zookeeper/start_zk.sh 1
#docker run --net hadoop-net --name centos-zk-102 --hostname centos-zk-102 --ip 192.168.8.102 -p 22181:2181 -v ~/MyData/BigData-in-practice/container/zk:/var/zookeeper --restart=always -d zhongchzh/centos-zookeeper /var/zookeeper/start_zk.sh 2
#docker run --net hadoop-net --name centos-zk-103 --hostname centos-zk-103 --ip 192.168.8.103 -p 32181:2181 -v ~/MyData/BigData-in-practice/container/zk:/var/zookeeper --restart=always -d zhongchzh/centos-zookeeper /var/zookeeper/start_zk.sh 3

echo "Create HDFS NameNode"
#docker run --net hadoop-net --name centos-nn-101 --hostname centos-nn-101 --ip 192.168.8.104 -p 50070:50070 -p 9000:9000 -p 14000:14000 -v ~/MyData/BigData-in-practice/container/hadoop:/var/hadoop --restart=always -d zhongchzh/centos-hadoop /var/hadoop/start.sh
#docker run --net hadoop-net --name centos-nn-102 --hostname centos-nn-102 --ip 192.168.8.105 -v ~/MyData/BigData-in-practice/container/hadoop:/var/hadoop --restart=always -d zhongchzh/centos-hadoop /var/hadoop/start.sh

echo "Create Yarn ResourceManager"
#docker run --net hadoop-net --name centos-rm-101 --hostname centos-rm-101 --ip 192.168.8.106 -p 8088:8088 -v ~/MyData/BigData-in-practice/container/hadoop:/var/hadoop --restart=always -d zhongchzh/centos-hadoop /var/hadoop/start.sh
#docker run --net hadoop-net --name centos-rm-102 --hostname centos-rm-102 --ip 192.168.8.107 -v ~/MyData/BigData-in-practice/container/hadoop:/var/hadoop --restart=always -d zhongchzh/centos-hadoop /var/hadoop/start.sh

echo "Create HDFS DataNode"
#docker run --net hadoop-net --name centos-dn-101 --hostname centos-dn-101 --ip 192.168.8.108 -p 18485:8485 -v ~/MyData/BigData-in-practice/container/hadoop:/var/hadoop --restart=always -d zhongchzh/centos-hadoop /var/hadoop/start.sh
#docker run --net hadoop-net --name centos-dn-102 --hostname centos-dn-102 --ip 192.168.8.109 -p 28485:8485 -v ~/MyData/BigData-in-practice/container/hadoop:/var/hadoop --restart=always -d zhongchzh/centos-hadoop /var/hadoop/start.sh
#docker run --net hadoop-net --name centos-dn-103 --hostname centos-dn-103 --ip 192.168.8.110 -p 38485:8485 -v ~/MyData/BigData-in-practice/container/hadoop:/var/hadoop --restart=always -d zhongchzh/centos-hadoop /var/hadoop/start.sh

#docker run --net container_hadoop_cluster_net --name centos-hue --hostname centos-hue --ip 192.168.8.201 -it -p 8888:8888 -v ~/MyData/BigData-in-practice/container/hue:/var/hue gethue/hue:latest /bin/bash