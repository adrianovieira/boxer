#!/bin/bash

if [[ -f /etc/os-release  ]]; then
  . /etc/os-release
fi

if [[ "$ID" == "debian" && "$VERSION_ID" == "8" ]]; then
  sudo apt-get clean
  sudo apt-get autoclean
  sudo apt-get install -qq -y --force-yes apt-transport-https curl wget
  sudo apt-get -qq update
  sudo apt-get upgrade -y
fi
