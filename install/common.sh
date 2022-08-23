#!/bin/bash

sudo apt update
sudo apt-get install -y apt-transport-https

# install essential tools
sudo apt-get install -y \
    software-properties-common \
    build-essential \
    wget \
    curl \
    vim \
    tmux \
    linux-perf \
    git

# install monitors
# - htop
# - iotop
# - sysstat:            iostat sar psstat
# - smartmontools:      smartctl
sudo apt-get install -y \
    htop \
    iotop \
    sysstat \
    smartmontools

# install bpf/bcc
sudo apt-get install -y \
	bpfcc-tools \
	linux-headers-`uname -r`

