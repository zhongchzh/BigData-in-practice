#This Dockerfile uses the centos image
#Author: zhongchzh

#基础镜像
FROM centos

#维护者信息
MAINTAINER zhongchzh zhongchzh@gmail.com

#安装JDK
COPY java/ /usr/local/java

#设置环境变量
ENV JAVA_HOME /usr/local/java
ENV PATH "${JAVA_HOME}/bin:${PATH}"
