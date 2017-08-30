#!/usr/bin/bash

NUMBER=$1
TARGET_DIR=$2

TEMP_DIR=$(mktemp --directory)
tar -xvf NthPrime.tgz --directory $TEMP_DIR

ls $TEMP_DIR

rm -rf $TEMP_DIR
