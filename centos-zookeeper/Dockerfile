#This Dockerfile uses the centos image
#Author: zhongchzh

#基础镜像
FROM zhongchzh/centos-jdk

#维护者信息
MAINTAINER zhongchzh zhongchzh@gmail.com

#复制hadoop安装包
COPY zookeeper/ /opt/zookeeper

#配置环境变量
ENV ZOOKEEPER_HOME /opt/zookeeper
ENV PATH ${ZOOKEEPER_HOME}/bin:$PATH


