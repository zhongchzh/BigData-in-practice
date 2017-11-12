#! /bin/bash

echo "该脚本用来创建hadoop容器集群"

docker build -t zhongchzh/centos-jdk ./centos-jdk

docker build -t zhongchzh/centos-zookeeper ./centos-zookeeper

docker build -t zhongchzh/centos-ssh ./centos-ssh

docker build -t zhongchzh/centos-jdk-ssh ./centos-jdk-ssh

docker build -t zhongchzh/centos-hadoop ./centos-hadoop

docker build -t zhongchzh/centos-hive ./centos-hive