#!/bin/bash

source config.sh

echo "install softwares ..."
bash node_setup.sh
bash install/tiup.sh

echo "begin setup private nodes ..."
bash copy_to_node.sh

for host in ${HOSTS_PRIVATE[@]}; do
    ssh ${USER}@${host} 'bash node_setup.sh' </dev/null &
done
wait

ssh ${USER}@${HOST_YCSB} ''