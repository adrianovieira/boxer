#!/bin/bash
# Install docker-engine-1.12.0-rc3 and docker-compose-1.8.0-rc2

if [[ -f /etc/os-release  ]]; then
  . /etc/os-release
fi

if [[ "$ID" == "centos" && "$VERSION_ID" == "7" ]]; then
  echo "INFO: [docker-install.sh] importing gpg key from dockerproject"
  sudo rpm --import https://yum.dockerproject.org/gpg
  sudo cp /home/vagrant/sync/centos7/yum.repos.d/* /etc/yum.repos.d/
  sudo yum clean all
  sudo yum update -y -q

  echo "INFO: [docker-install.sh] install docker-engine"
  sudo yum install -y docker-engine-1.12.1-1.el7.centos.x86_64.rpm

  echo "INFO: [docker-install.sh] start docker-engine"
  sudo systemctl daemon-reload
  sudo systemctl enable docker && sudo systemctl start docker

  echo "INFO: [docker-install.sh] install docker-compose"
  sudo curl -L https://github.com/docker/compose/releases/download/1.8.0/docker-compose-`uname -s`-`uname -m` > /tmp/docker-compose
  sudo chmod +x /tmp/docker-compose
  sudo mv /tmp/docker-compose /usr/local/bin/docker-compose
  sudo rm -f /tmp/docker-compose

  echo "INFO: [docker-install.sh] setup vagrant user as a docker group member"
  sudo usermod -G docker vagrant

  echo "INFO: [docker-install.sh] finished"

fi
