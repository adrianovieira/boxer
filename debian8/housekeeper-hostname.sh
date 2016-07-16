#!/bin/bash

if [[ -f /etc/os-release  ]]; then
  . /etc/os-release
fi

if [[ "x$1" != "x" ]]; then
  HOSTNAME=$1
else
  HOSTNAME=localhost
fi
if [[ "$ID" == "debian" && "$VERSION_ID" == "8" ]]; then
  sudo hostnamectl set-hostname $HOSTNAME
  sudo hostnamectl status
fi
