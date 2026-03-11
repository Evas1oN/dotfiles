#!/bin/bash

[ -f /etc/apt/sources.list.d/virtualbox.sources ] && { echo "VirtualBox repository need to be installed"; exit 1 }

apt update -y && apt install -y vboxmanage-bash-completion virtualbox-7.2