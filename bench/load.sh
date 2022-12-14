#!/bin/bash

# This script load data for the after test.
# User need to ensure that the environment variables used below have been defined.
set -u

# load - dotransactions=false
# thread:
#   -p threadcount=200
#   --threads=200
# opcount = insert count if set, otherwise record count.
# buildKeyName: depend on orderedInserts, hash keyNum if not set.
# insertorder: default is hashed. if insertorder == hashed(default), then orderedInserts is false.
# keyNum: from keySequence, which provides a increment counter.
# DoInsert

# tikv releated API
# tikvPD = "tikv.pd"
# // raw, txn, or coprocessor
# tikvType       = "tikv.type"
# tikvConnCount  = "tikv.conncount"
# tikvBatchSize  = "tikv.batchsize"
# tikvAPIVersion = "tikv.apiversion"

# Remove since it not take effects: -P workloads/workloada
./go-ycsb load tikv \
    --threads ${THREAD_COUNT} \
    -p tikv.pd="${HOST_PD}:2379" \
    -p tikv.type="raw" \
    -p recordcount=${RECORD_COUNT} \
    -p operationcount=${OPERATION_COUNT} |
    tee ${TEST_NAME}.load.log
