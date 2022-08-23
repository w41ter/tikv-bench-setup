#!/bin/bash

set -e

# This script will install tiup and tiup components.

echo "1. install tiup ..."
curl --proto '=https' --tlsv1.2 -sSf https://tiup-mirrors.pingcap.com/install.sh | sh

echo "2. install tiup cluster ..."
if [ -f ~/.bash_profile ]; then
    source ~/.bash_profile
else
    source ~/.bashrc
fi

tiup cluster
