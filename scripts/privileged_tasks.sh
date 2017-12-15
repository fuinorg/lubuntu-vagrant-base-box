#!/bin/bash -xe

#Set Hostname
sudo hostnamectl set-hostname vagrant

# Updating and Upgrading dependencies
sudo apt-get update -y
sudo apt-get upgrade -y

# Install necessary libraries for guest additions and Vagrant NFS Share
sudo apt-get -y -q install linux-headers-generic build-essential dkms nfs-common

# Install necessary dependencies
sudo apt-get -y -q install curl wget vim nano

# Setup sudo to allow no-password sudo for "admin"
groupadd -r admin
usermod -a -G admin vagrant
cp /etc/sudoers /etc/sudoers.orig
sed -i -e '/Defaults\s\+env_reset/a Defaults\texempt_group=admin' /etc/sudoers
sed -i -e 's/%admin ALL=(ALL) ALL/%admin ALL=NOPASSWD:ALL/g' /etc/sudoers
