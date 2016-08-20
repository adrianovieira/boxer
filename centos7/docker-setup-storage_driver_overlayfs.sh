#!/bin/bash

if [[ -f /etc/os-release  ]]; then
  . /etc/os-release
fi

if [[ "$ID" == "centos" && "$VERSION_ID" == "7" ]]; then
  echo "INFO: [docker-setup-storage_driver_overlayfs.sh] setting docker service storage driver to overlay"
  sudo systemctl stop docker
  sudo mkdir -p /etc/systemd/system/docker.service.d
  file_name_config=docker_overlayfs.conf
  sudo echo "[Service]" > /tmp/$file_name_config
  sudo echo "ExecStart=" >> /tmp/$file_name_config
  sudo echo "ExecStart=/usr/bin/docker daemon --storage-driver=overlay -D" >> /tmp/$file_name_config
  sudo mv /tmp/$file_name_config /etc/systemd/system/docker.service.d/$file_name_config
  sudo systemctl daemon-reload && sudo systemctl start docker
  echo "INFO: [docker-setup-storage_driver_overlayfs.sh] finished"
fi
