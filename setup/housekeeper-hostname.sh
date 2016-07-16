#!/bin/bash

if [[ -f /etc/os-release  ]]; then
  . /etc/os-release
fi

if [[ "x$1" != "x" ]]; then
  HOSTNAME=$1
else
  HOSTNAME=localhost
fi
if [[ "$ID" == "centos" && "$VERSION_ID" == "7" ]]; then
  sudo hostnamectl set-hostname $HOSTNAME
  sudo hostnamectl status
fi
