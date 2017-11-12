#This Dockerfile uses the zhongchzh/centos-hadoop image
#Author: zhongchzh

#基础镜像
FROM zhongchzh/centos-hadoop

#维护者信息
MAINTAINER zhongchzh zhongchzh@gmail.com

#复制hive安装包
COPY hive/ /opt/hive

#配置环境变量
ENV HIVE_HOME /opt/hive
ENV PATH "${HIVE_HOME}/bin:${PATH}"
