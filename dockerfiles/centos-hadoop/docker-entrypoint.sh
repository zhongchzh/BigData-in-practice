#! /bin/bash

#修改hadoop配置文件
\cp /var/hadoop/core-site.xml /opt/hadoop/etc/hadoop/core-site.xml
\cp /var/hadoop/hdfs-site.xml /opt/hadoop/etc/hadoop/hdfs-site.xml
\cp /var/hadoop/httpfs-site.xml /opt/hadoop/etc/hadoop/httpfs-site.xml
\cp /var/hadoop/mapred-site.xml /opt/hadoop/etc/hadoop/mapred-site.xml
\cp /var/hadoop/yarn-site.xml /opt/hadoop/etc/hadoop/yarn-site.xml
\cp /var/hadoop/masters /opt/hadoop/etc/hadoop/masters
\cp /var/hadoop/slaves /opt/hadoop/etc/hadoop/slaves

/usr/sbin/sshd -D