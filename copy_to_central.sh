#!/bin/bash

source config.sh

function upload() {
    local path=$1

    scp -r ${path} ${USER}@${HOST_CENTRAL}:~
}

upload config.sh
upload node_setup.sh
upload central_setup.sh
upload copy_to_node.sh
upload generate_topology.sh
upload install
upload tools

upload go1.19.linux-amd64.tar.gz
upload go-ycsb/bin/go-ycsb
upload go-ycsb/workloads
