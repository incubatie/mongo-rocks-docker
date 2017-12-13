#!/usr/bin/env bash

BUCKET=$1
BUCKET_PREFIX=$2
MOUNT_POINT=$3

/usr/local/bin/yas3fs s3://${BUCKET}/${BUCKET_PREFIX} ${MOUNT_POINT} --mkdir --no-metadata --read-only -f -d
/usr/bin/mongoq -b=${BUCKET} -p=${BUCKET_PREFIX} -m=${MOUNT_POINT}
