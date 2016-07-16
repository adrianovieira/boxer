#!/bin/bash
# upload VBoxGuestAdditions.iso to /home/vagrant/sync

if [[ -f /etc/os-release  ]]; then
  . /etc/os-release
fi

if [[ "$ID" == "centos" && "$VERSION_ID" == "7" ]]; then
  echo "INFO: [vboxguestadditions-install.sh] Install VBoxGuestAdditions"
  sudo yum -y install epel-release
  sudo yum clean all
  sudo yum -y install gcc make bzip2 kernel-headers kernel-devel-`uname -r` dkms
  sudo ln -s /usr/src/kernels/`uname -r`/ /usr/src/linux
  sudo yum clean all
  sudo mount -o loop /home/vagrant/sync/VBoxGuestAdditions.iso /mnt
  sudo sh /mnt/VBoxLinuxAdditions.run
  sudo umount /mnt
  sudo rm -f /usr/src/linux
  sudo yum -y remove gcc make bzip2 kernel-headers kernel-devel-`uname -r`
  sudo yum clean all
fi
