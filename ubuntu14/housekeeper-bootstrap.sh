#!/bin/bash

if [[ -f /etc/os-release  ]]; then
  . /etc/os-release
fi

if [[ "$ID" == "ubuntu" && "$VERSION_ID" == "14.04" ]]; then
  sudo apt-get -qq autoclean
  sudo apt-get -qq update
  sudo apt-get -y safe-upgrade
fi
