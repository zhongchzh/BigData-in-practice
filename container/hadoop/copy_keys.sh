#! /bin/bash

ssh-keygen -t rsa -f ~/.ssh/id_rsa -N ''

ssh-copy-id centos-master

ssh-copy-id centos-slave-101
ssh-copy-id centos-slave-102
ssh-copy-id centos-slave-103