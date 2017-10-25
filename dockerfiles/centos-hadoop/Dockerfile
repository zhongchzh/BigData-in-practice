#This Dockerfile uses the centos image
#Author: zhongchzh

#基础镜像
FROM zhongchzh/centos-jdk

#维护者信息
MAINTAINER zhongchzh zhongchzh@gmail.com

#复制hadoop安装包
COPY hadoop/ /opt/hadoop

#安装openssh-server
RUN yum install iproute which openssl openssh-server openssh-clients -y\
 && sed -i "s/#UsePrivilegeSeparation.*/UsePrivilegeSeparation no/g" /etc/ssh/sshd_config\
 && sed -i "s/UsePAM.*/UsePAM no/g" /etc/ssh/sshd_config\
 && ssh-keygen -q -t rsa -b 2048 -f /etc/ssh/ssh_host_rsa_key -N ''\
 && ssh-keygen -q -t ecdsa -f /etc/ssh/ssh_host_ecdsa_key -N ''\
 && ssh-keygen -t dsa -f /etc/ssh/ssh_host_ed25519_key  -N ''

#配置环境变量
ENV HADOOP_HOME /opt/hadoop

#暴露22端口
EXPOSE 22

#启动ssh服务
CMD ["/usr/sbin/sshd", "-D"]
