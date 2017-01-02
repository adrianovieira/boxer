#!/bin/bash
# upload VBoxGuestAdditions.iso to /home/vagrant/sync

if [[ -f /etc/os-release  ]]; then
  . /etc/os-release
fi

if [[ "$ID" == "debian" && "$VERSION_ID" == "8" ]]; then
  echo "INFO: [vboxguestadditions-install.sh] Install VBoxGuestAdditions"
  sudo cp /vagrant/debian8/apt.source.list/debian-jessie-contrib.list /etc/apt/sources.list.d/debian-jessie-contrib.list
  sudo apt-get update
  sudo apt-get install -y --force-yes virtualbox-guest-x11
fi
