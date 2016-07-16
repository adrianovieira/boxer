#!/bin/bash

if [[ -f /etc/os-release  ]]; then
  . /etc/os-release
fi

if [[ "$ID" == "debian" && "$VERSION_ID" == "8" ]]; then
  sudo apt-get clean
  sudo apt-get -qq autoclean
  sudo apt-get -qq update
  sudo apt-get -y safe-upgrade
fi
