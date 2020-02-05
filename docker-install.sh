#/bin/bash

sudo yum update -y

#docker setup 
sudo dnf config-manager --add-repo=https://download.docker.com/linux/centos/docker-ce.repo
sudo dnf -y  install docker-ce --nobest

sudo systemctl enable -now docker
