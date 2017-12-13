#!/usr/bin/env bash

/usr/bin/mongod --dbpath=${DB_DIR} --storageEngine=rocksdb --bind_ip_all
