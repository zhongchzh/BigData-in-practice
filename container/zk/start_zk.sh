#! /bin/bash

\cp /var/zookeeper/hosts /etc/hosts

mkdir /opt/zookeeper/data

echo "`basename $1`" >> /opt/zookeeper/data/myid

zkServer.sh start-foreground /var/zookeeper/zoo.cfg