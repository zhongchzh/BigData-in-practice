#! /bin/bash

ssh-keygen -t rsa -f ~/.ssh/id_rsa -N ''

ssh-copy-id centos-nn-101
ssh-copy-id centos-nn-102

ssh-copy-id centos-rm-101
ssh-copy-id centos-rm-102

ssh-copy-id centos-dn-101
ssh-copy-id centos-dn-102
ssh-copy-id centos-dn-103