#!/bin/bash

if [[ -f /etc/os-release  ]]; then
  . /etc/os-release
fi

if [[ "$ID" == "centos" && "$VERSION_ID" == "7" ]]; then
  sudo rm -f /etc/profile.d/proxy.sh
  sudo sed -e 's/proxy.*//' -i /etc/yum.conf
fi

sudo rm -rf /home/vagrant/sync
sudo rm -rf /etc/sysconfig/network-scripts/ifcfg-eth[1-5]
sudo yum clean all
yum clean all
