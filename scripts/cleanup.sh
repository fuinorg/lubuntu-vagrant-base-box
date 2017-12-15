#!/bin/bash -xe

# Remove some packages to get a minimal install
echo "==> Removing all linux kernels except the current one"
dpkg --list | awk '{ print $2 }' | grep -e 'linux-\(headers\|image\)-.*[0-9]\($\|-generic\)' | grep -v "$(uname -r | sed 's/-generic//')" | xargs apt-get -y purge
echo "==> Removing linux source"
dpkg --list | awk '{ print $2 }' | grep linux-source | xargs apt-get -y purge
echo "==> Removing development packages"
dpkg --list | awk '{ print $2 }' | grep -- '-dev$' | xargs apt-get -y purge
echo "==> Removing documentation"
dpkg --list | awk '{ print $2 }' | grep -- '-doc$' | xargs apt-get -y purge

echo "==> Cleaning APT environment"
apt-get -y autoremove --purge
apt-get -y autoclean
apt-get -y clean

# Zero out the free space to save space in the final image:
dd if=/dev/zero of=/EMPTY bs=1M || true
rm -f /EMPTY

# Sync to ensure that the delete completes before this moves on.
sync
sync
sync
