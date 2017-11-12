version: '2'
services:
    zookeeper-101:
        image: zookeeper
        restart: always
        container_name: centos-zk-101
        hostname: centos-zk-101
        networks:
            hadoop_cluster_net:
                ipv4_address: 192.168.8.101
        ports:
            - "12181:2181"
        environment: 
            ZOO_MY_ID: 1
            ZOO_SERVERS: server.1=centos-zk-101:2888:3888 server.2=centos-zk-102:2888:3888 server.3=centos-zk-103:2888:3888
        extra_hosts:
            - "centos-zk-102:192.168.8.102"
            - "centos-zk-103:192.168.8.103"
        
    zookeeper-102:
        image: zookeeper
        restart: always
        container_name: centos-zk-102
        hostname: centos-zk-102
        networks:
            hadoop_cluster_net:
                ipv4_address: 192.168.8.102
        ports:
            - "22181:2181"
        environment: 
            ZOO_MY_ID: 2
            ZOO_SERVERS: server.1=centos-zk-101:2888:3888 server.2=centos-zk-102:2888:3888 server.3=centos-zk-103:2888:3888
        extra_hosts:
            - "centos-zk-101:192.168.8.101"
            - "centos-zk-103:192.168.8.103"
        
    zookeeper-103:
        image: zookeeper
        restart: always
        container_name: centos-zk-103
        hostname: centos-zk-103
        networks:
            hadoop_cluster_net:
                ipv4_address: 192.168.8.103
        ports:
            - "32181:2181"
        environment: 
            ZOO_MY_ID: 3
            ZOO_SERVERS: server.1=centos-zk-101:2888:3888 server.2=centos-zk-102:2888:3888 server.3=centos-zk-103:2888:3888
        extra_hosts:
            - "centos-zk-101:192.168.8.101"
            - "centos-zk-102:192.168.8.102"

    namenode-101:
        image: zhongchzh/centos-hive
        restart: always
        container_name: centos-nn-101
        hostname: centos-nn-101
        networks:
            hadoop_cluster_net:
                ipv4_address: 192.168.8.104
        ports:
            - "51070:50070"
            - "9100:9000"
            - "14100:14000"
            - "14101:14001"
        extra_hosts:
            - "centos-zk-101:192.168.8.101"
            - "centos-zk-102:192.168.8.102"
            - "centos-zk-103:192.168.8.103"
            - "centos-nn-102:192.168.8.105"
            - "centos-rm-101:192.168.8.106"
            - "centos-rm-102:192.168.8.107"
            - "centos-dn-101:192.168.8.108"
            - "centos-dn-102:192.168.8.109"
            - "centos-dn-103:192.168.8.110"
            - "debian-mysql:192.168.8.201"
        volumes:
            - ~/MyData/BigData-in-practice/container/hadoop:/var/hadoop
            - ~/MyData/BigData-in-practice/container/hive/hive-site.xml:/opt/hive/conf/hive-site.xml
            - ~/MyData/BigData-in-practice/container/hive/hive-env.sh:/opt/hive/conf/hive-env.sh
        depends_on:
            - zookeeper-101
            - zookeeper-102
            - zookeeper-103
            
    namenode-102:
        image: zhongchzh/centos-hive
        restart: always
        container_name: centos-nn-102
        hostname: centos-nn-102
        networks:
            hadoop_cluster_net:
                ipv4_address: 192.168.8.105
        ports:
            - "52070:50070"
            - "9200:9000"
            - "14200:14000"
            - "14201:14001"
        extra_hosts:
            - "centos-zk-101:192.168.8.101"
            - "centos-zk-102:192.168.8.102"
            - "centos-zk-103:192.168.8.103"
            - "centos-nn-101:192.168.8.104"
            - "centos-rm-101:192.168.8.106"
            - "centos-rm-102:192.168.8.107"
            - "centos-dn-101:192.168.8.108"
            - "centos-dn-102:192.168.8.109"
            - "centos-dn-103:192.168.8.110"
            - "debian-mysql:192.168.8.201"
        volumes:
            - ~/MyData/BigData-in-practice/container/hadoop:/var/hadoop
            - ~/MyData/BigData-in-practice/container/hive/hive-site.xml:/opt/hive/conf/hive-site.xml
            - ~/MyData/BigData-in-practice/container/hive/hive-env.sh:/opt/hive/conf/hive-env.sh
        depends_on:
            - zookeeper-101
            - zookeeper-102
            - zookeeper-103
            
    resourcemanager-101:
        image: zhongchzh/centos-hive
        restart: always
        container_name: centos-rm-101
        hostname: centos-rm-101
        networks:
            hadoop_cluster_net:
                ipv4_address: 192.168.8.106
        ports:
            - "18088:8088"
        extra_hosts:
            - "centos-zk-101:192.168.8.101"
            - "centos-zk-102:192.168.8.102"
            - "centos-zk-103:192.168.8.103"
            - "centos-nn-101:192.168.8.104"
            - "centos-nn-102:192.168.8.105"
            - "centos-rm-102:192.168.8.107"
            - "centos-dn-101:192.168.8.108"
            - "centos-dn-102:192.168.8.109"
            - "centos-dn-103:192.168.8.110"
            - "debian-mysql:192.168.8.201"
        volumes:
            - ~/MyData/BigData-in-practice/container/hadoop:/var/hadoop
            - ~/MyData/BigData-in-practice/container/hive/hive-site.xml:/opt/hive/conf/hive-site.xml
            - ~/MyData/BigData-in-practice/container/hive/hive-env.sh:/opt/hive/conf/hive-env.sh
        depends_on:
            - zookeeper-101
            - zookeeper-102
            - zookeeper-103
            
    resourcemanager-102:
        image: zhongchzh/centos-hive
        restart: always
        container_name: centos-rm-102
        hostname: centos-rm-102
        networks:
            hadoop_cluster_net:
                ipv4_address: 192.168.8.107
        ports:
            - "28088:8088"
        extra_hosts:
            - "centos-zk-101:192.168.8.101"
            - "centos-zk-102:192.168.8.102"
            - "centos-zk-103:192.168.8.103"
            - "centos-nn-101:192.168.8.104"
            - "centos-nn-102:192.168.8.105"
            - "centos-rm-101:192.168.8.106"
            - "centos-dn-101:192.168.8.108"
            - "centos-dn-102:192.168.8.109"
            - "centos-dn-103:192.168.8.110"
            - "debian-mysql:192.168.8.201"
        volumes:
            - ~/MyData/BigData-in-practice/container/hadoop:/var/hadoop
            - ~/MyData/BigData-in-practice/container/hive/hive-site.xml:/opt/hive/conf/hive-site.xml
            - ~/MyData/BigData-in-practice/container/hive/hive-env.sh:/opt/hive/conf/hive-env.sh
        depends_on:
            - zookeeper-101
            - zookeeper-102
            - zookeeper-103
            
    datanode-101:
        image: zhongchzh/centos-hive
        restart: always
        container_name: centos-dn-101
        hostname: centos-dn-101
        networks:
            hadoop_cluster_net:
                ipv4_address: 192.168.8.108
        ports:
            - "51010:50010"
            - "51020:50020"
            - "51075:50075"
        extra_hosts:
            - "centos-zk-101:192.168.8.101"
            - "centos-zk-102:192.168.8.102"
            - "centos-zk-103:192.168.8.103"
            - "centos-nn-101:192.168.8.104"
            - "centos-nn-102:192.168.8.105"
            - "centos-rm-101:192.168.8.106"
            - "centos-rm-102:192.168.8.107"
            - "centos-dn-102:192.168.8.109"
            - "centos-dn-103:192.168.8.110"
            - "debian-mysql:192.168.8.201"
        volumes:
            - ~/MyData/BigData-in-practice/container/hadoop:/var/hadoop
            - ~/MyData/BigData-in-practice/container/hive/hive-site.xml:/opt/hive/conf/hive-site.xml
            - ~/MyData/BigData-in-practice/container/hive/hive-env.sh:/opt/hive/conf/hive-env.sh
            
    datanode-102:
        image: zhongchzh/centos-hive
        restart: always
        container_name: centos-dn-102
        hostname: centos-dn-102
        networks:
            hadoop_cluster_net:
                ipv4_address: 192.168.8.109
        ports:
            - "52010:50010"
            - "52020:50020"
            - "52075:50075"
        extra_hosts:
            - "centos-zk-101:192.168.8.101"
            - "centos-zk-102:192.168.8.102"
            - "centos-zk-103:192.168.8.103"
            - "centos-nn-101:192.168.8.104"
            - "centos-nn-102:192.168.8.105"
            - "centos-rm-101:192.168.8.106"
            - "centos-rm-102:192.168.8.107"
            - "centos-dn-101:192.168.8.108"
            - "centos-dn-103:192.168.8.110"
            - "debian-mysql:192.168.8.201"
        volumes:
            - ~/MyData/BigData-in-practice/container/hadoop:/var/hadoop
            - ~/MyData/BigData-in-practice/container/hive/hive-site.xml:/opt/hive/conf/hive-site.xml
            - ~/MyData/BigData-in-practice/container/hive/hive-env.sh:/opt/hive/conf/hive-env.sh
        
    datanode-103:
        image: zhongchzh/centos-hive
        restart: always
        container_name: centos-dn-103
        hostname: centos-dn-103
        networks:
            hadoop_cluster_net:
                ipv4_address: 192.168.8.110
        ports:
            - "53010:50010"
            - "53020:50020"
            - "53075:50075"
        extra_hosts:
            - "centos-zk-101:192.168.8.101"
            - "centos-zk-102:192.168.8.102"
            - "centos-zk-103:192.168.8.103"
            - "centos-nn-101:192.168.8.104"
            - "centos-nn-102:192.168.8.105"
            - "centos-rm-101:192.168.8.106"
            - "centos-rm-102:192.168.8.107"
            - "centos-dn-101:192.168.8.108"
            - "centos-dn-102:192.168.8.109"
            - "debian-mysql:192.168.8.201"
        volumes:
            - ~/MyData/BigData-in-practice/container/hadoop:/var/hadoop
            - ~/MyData/BigData-in-practice/container/hive/hive-site.xml:/opt/hive/conf/hive-site.xml
            - ~/MyData/BigData-in-practice/container/hive/hive-env.sh:/opt/hive/conf/hive-env.sh
            

#    hue-101:
#        image: gethue/hue
#        restart: always
#        container_name: ubuntu-hue
#        hostname: ubuntu-hue
#        networks:
#            hadoop_cluster_net:
#                ipv4_address: 192.168.8.200
#        ports:
#            - "8888:8888"
#        extra_hosts:
#            - "centos-zk-101:192.168.8.101"
#            - "centos-zk-102:192.168.8.102"
#            - "centos-zk-103:192.168.8.103"
#            - "centos-nn-101:192.168.8.104"
#            - "centos-nn-102:192.168.8.105"
#            - "centos-rm-101:192.168.8.106"
#            - "centos-rm-102:192.168.8.107"
#            - "centos-dn-101:192.168.8.108"
#            - "centos-dn-102:192.168.8.109"
#            - "centos-dn-102:192.168.8.110"
#        volumes:
#            - ~/MyData/BigData-in-practice/container/hue/pseudo-distributed.ini:/hue/desktop/conf/pseudo-distributed.ini

            
    mysql-101:
        image: mysql:5.6
        restart: always
        container_name: debian-mysql
        hostname: debian-mysql
        networks:
            hadoop_cluster_net:
                ipv4_address: 192.168.8.201
        ports:
            - "13306:3306"
        environment: 
            MYSQL_ROOT_PASSWORD: root
        volumes:
            - ~/MyData/BigData-in-practice/container/mysql:/var/lib/mysql
                  
networks:
  hadoop_cluster_net:
    driver: bridge
    ipam:
        driver: default
        config:
            - subnet: 192.168.8.0/16