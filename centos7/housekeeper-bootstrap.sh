#!/bin/bash

if [[ -f /etc/os-release  ]]; then
  . /etc/os-release
fi

if [[ "$ID" == "centos" && "$VERSION_ID" == "7" ]]; then
  echo "INFO: [housekeeper-bootstrap.sh] enable some additional repos"
  sudo rpm --import https://yum.dockerproject.org/gpg
  sudo cp /home/vagrant/sync/centos7/yum.repos.d/* /etc/yum.repos.d/
  #sudo rpm -Uvh https://yum.puppetlabs.com/puppetlabs-release-pc1-el-7.noarch.rpm
  sudo yum clean all
  sudo yum -y install epel-release
  sudo yum update -y
  sudo yum install -y vim net-tools puppet-agent
  sudo yum clean all
fi
