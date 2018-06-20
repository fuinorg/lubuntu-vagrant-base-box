# lubuntu-vagrant-base-box
Packer script that creates a Lubuntu alternate Vagrant base box.

[![Build Status](https://fuin-org.ci.cloudbees.com/job/lubuntu-vagrant-base-box/badge/icon)](https://fuin-org.ci.cloudbees.com/job/lubuntu-vagrant-base-box/)
[![GPLv3 License](http://img.shields.io/badge/license-GPLv3-blue.svg)](https://www.gnu.org/licenses/gpl-3.0.en.html)

# Download
You can download the pre-built base boxes here:
https://app.vagrantup.com/fuin/boxes/lubuntu-17.10-alternate-amd64/

# Build
You can easily build the base box on your local PC (bare metal).

## Prerequisites
Make sure that you have installed at least one of the following tools:
* [VirtualBox](https://www.virtualbox.org/)
* [VMware Workstation](http://store.vmware.com/store/vmwde/en_IE/DisplayProductDetailsPage/ThemeID.29219600/productID.5128762700) (Not free)

Also install:
* [Packer](https://www.packer.io/)

Checkout this repository or download and unzip the content to your hard disk.

## Build
Execute the following commands in the root directory (where the config.json file is located).
The below configuration sets the necessary values to push the new image to your Vagrant cloud account.

To build a virtualbox base box:
```
packer build \
   -var 'cloud_token=XXXXXXXXXXXXXXXXX' \
   -var 'cloud_version=0.1.2' \
   -var 'cloud_tag=youraccount/lubuntu-17.10-alternate-amd64' \
   -only virtualbox-build
   config.json
```

To build a vmware base box:
```
packer build \
   -var 'cloud_token=XXXXXXXXXXXXXXXXX' \
   -var 'cloud_version=0.1.2' \
   -var 'cloud_tag=youraccount/lubuntu-17.10-alternate-amd64' \
   -only vmware-build
   config.json
```

## Credits
Many thanks to [Aaron](https://github.com/slapula/) who created this [Packer](https://www.packer.io/) script.
You can hire him as a freelancer at [upwork.com](https://www.upwork.com/o/profiles/users/_~01d7141121116c4a6e/).
