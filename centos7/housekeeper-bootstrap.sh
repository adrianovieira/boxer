#!/bin/bash

if [[ -f /etc/os-release  ]]; then
  . /etc/os-release
fi

if [[ "$ID" == "centos" && "$VERSION_ID" == "7" ]]; then
  sudo yum clean all
  sudo yum -y install epel-release
  sudo yum clean all
  sudo yum update -y
  sudo yum clean all
fi
