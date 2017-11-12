#This Dockerfile uses the zhongchzh/centos-jdk-ssh image
#Author: zhongchzh

#基础镜像
FROM zhongchzh/centos-jdk-ssh

#维护者信息
MAINTAINER zhongchzh zhongchzh@gmail.com

#复制hadoop安装包
COPY hadoop/ /opt/hadoop

#复制执行脚本
COPY docker-entrypoint.sh ~/

#修改root密码
RUN echo "root" | passwd --stdin root

#配置环境变量
ENV HADOOP_HOME /opt/hadoop
ENV PATH "${HADOOP_HOME}/bin:${HADOOP_HOME}/sbin:${PATH}"

#暴露端口
EXPOSE 9000 9001 14000 14001 50010 50020 50070 50075

#执行命令
ENTRYPOINT ["~/docker-entrypoint.sh"]