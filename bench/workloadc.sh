#!/bin/bash

# This script run a full round of tests.
# User need to ensure that the environment variables used below have been defined.
set -u

echo "run workloadc ..."
./go-ycsb run tikv -P workloads/workloadc \
    --threads ${THREAD_COUNT} \
    -p tikv.pd="${HOST_PD}:2379" \
    -p tikv.type="raw" \
    -p recordcount=${RECORD_COUNT} \
    -p operationcount=${OPERATION_COUNT} \
    -p requestdistribution=zipfian |
    tee ${TEST_NAME}.${THREAD_COUNT}.workloadc.log
