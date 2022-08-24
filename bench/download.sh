#!/bin/bash

set -e

source config.sh
source bench/config.sh

mkdir ${TEST_NAME}
scp -r -o ProxyJump=${USER}@${HOST_CENTRAL} ${USER}@${HOST_YCSB}:~/${TEST_NAME}*.*load*.log ./${TEST_NAME}
