#!/bin/bash

# This script will establish ssh authorization for the central node.
source config.sh

# Install rsa keys
ssh ${USER}@${HOST_CENTRAL} 'if [ ! -f /root/.ssh/id_rsa ]; then ssh-keygen -t rsa -N "" -f /root/.ssh/id_rsa; fi'
scp ${USER}@${HOST_CENTRAL}:~/.ssh/id_rsa.pub .
scp ${USER}@${HOST_CENTRAL}:~/.ssh/id_rsa .

for host in ${HOSTS_PRIVATE[@]}; do
	ssh-copy-id -i id_rsa.pub  -o ProxyJump=${USER}@${HOST_CENTRAL} ${USER}@${host} </dev/null
done
