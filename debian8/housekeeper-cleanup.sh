#!/bin/bash

if [[ -f /etc/os-release  ]]; then
  . /etc/os-release
fi

if [[ "$ID" == "debian" && "$VERSION_ID" == "8" ]]; then
  sudo rm -f /etc/profile.d/proxy.sh
  sudo apt-get clean
  sudo apt-get autoclean
fi

sudo rm -rf /home/vagrant/sync
sudo rm -rf /vagrant
