#!/bin/bash

if [[ -f /etc/os-release  ]]; then
  . /etc/os-release
fi

if [[ "$ID" == "centos" && "$VERSION_ID" == "7" ]]; then
  sudo rm -f /etc/profile.d/proxy.sh
fi

sudo rm -rf /home/vagrant/sync
