#! /bin/bash

echo "该脚本用来创建hadoop容器集群"

echo "删除以下名字的容器"
docker rm -f centos-zk-101 centos-zk-102 centos-zk-103

#echo "创建zookeeper节点"
docker run --net hadoop-net --name centos-zk-101 --hostname centos-zk-101 --ip 192.168.8.101 -v ~/MyData/BigData-in-practice/container/zk:/var/zookeeper -d zhongchzh/centos-zookeeper /var/zookeeper/start_zk.sh 1
docker run --net hadoop-net --name centos-zk-102 --hostname centos-zk-102 --ip 192.168.8.102 -v ~/MyData/BigData-in-practice/container/zk:/var/zookeeper -d zhongchzh/centos-zookeeper /var/zookeeper/start_zk.sh 2
docker run --net hadoop-net --name centos-zk-103 --hostname centos-zk-103 --ip 192.168.8.103 -v ~/MyData/BigData-in-practice/container/zk:/var/zookeeper -d zhongchzh/centos-zookeeper /var/zookeeper/start_zk.sh 3