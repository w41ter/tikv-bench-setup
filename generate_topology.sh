#!/bin/bash

# This script will generate tiup topology.yaml file.
source config.sh

TOPO=topology.yaml

function generate_tikv_servers() {
    for host in ${HOST_TIKV_NODES[@]}; do
        echo "  - host: ${host}"
    done
}

cat >${TOPO} <<EOF
global:
  user: "tidb"
  ssh_port: 22
  deploy_dir: "/tidb-deploy"
  data_dir: "/tidb-data"
server_configs: {}
pd_servers:
  - host: ${HOST_PD}
tikv_servers:
$(generate_tikv_servers)
monitoring_servers:
  - host: ${HOST_CENTRAL}
grafana_servers:
  - host: ${HOST_CENTRAL}
alertmanager_servers:
  - host: ${HOST_CENTRAL_PRIVATE}

EOF
