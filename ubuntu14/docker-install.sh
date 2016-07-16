#!/bin/bash

if [[ -f /etc/os-release  ]]; then
  . /etc/os-release
fi

if [[ "$ID" == "ubuntu" && "$VERSION_ID" == "14.04" ]]; then
  echo "INFO: [docker-install.sh] importing gpg key from dockerproject"
  sudo apt-key adv --keyserver hkp://p80.pool.sks-keyservers.net:80 --recv-keys 58118E89F3A912897C070ADBF76221572C52609D

  echo "INFO: [docker-install.sh] install docker-engine"
  sudo cp /home/vagrant/sync/setup/apt.source.list/docker-ubuntu-trusty.list /etc/apt/sources.list.d/docker.list
  sudo apt-get -qq autoclean
  sudo apt-get -qq update
  sudo apt-get -qq -y --force-yes install language-pack-pt docker-engine=1.12.0~rc3-0~trusty

  echo "INFO: [docker-install.sh] status docker-engine"
  service docker status
  if [[ "$?" == "1" ]]; then
    echo "INFO: [docker-install.sh] start docker-engine"
    sudo service docker start
  fi

  echo "INFO: [docker-install.sh] install docker-compose"
  sudo curl -L https://github.com/docker/compose/releases/download/1.8.0-rc2/docker-compose-`uname -s`-`uname -m` > /tmp/docker-compose
  sudo chmod +x /tmp/docker-compose
  sudo mv /tmp/docker-compose /usr/local/bin/docker-compose
  sudo rm -f /tmp/docker-compose

  echo "INFO: [docker-install.sh] setup vagrant user as a docker group member"
  sudo usermod -G docker vagrant
  
  echo "INFO: [docker-install.sh] finished"
fi
