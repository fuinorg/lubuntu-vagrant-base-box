#!/bin/bash -xe

mkdir -p ~/.ssh
chmod 0700 ~/.ssh
wget --no-check-certificate https://raw.githubusercontent.com/hashicorp/vagrant/master/keys/vagrant.pub -O ~/.ssh/authorized_keys
chmod 0600 ~/.ssh/authorized_keys
chown -R vagrant ~/.ssh
