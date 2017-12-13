#!/usr/bin/env bash

# https://github.com/facebookgo/rocks-strata/blob/master/examples/backup/run.sh

BUCKET=$1
BUCKET_PREFIX=$2
REPLICA_ID=$3
DELETE_OLDER_THAN=$4
SSD="/sbin/start-stop-daemon --start --exec /usr/bin/strata"

# Uses start-stop-daemon because, for a given replica ID, only one write-capable operation should run at once.
$SSD -- backup -b=${BUCKET} -p=${BUCKET_PREFIX} -r=${REPLICA_ID};
$SSD -- delete -b=${BUCKET} -p=${BUCKET_PREFIX} -r=${REPLICA_ID} -a=${DELETE_OLDER_THAN};
$SSD -- gc -b=${BUCKET} -p=${BUCKET_PREFIX} -r=${REPLICA_ID};
