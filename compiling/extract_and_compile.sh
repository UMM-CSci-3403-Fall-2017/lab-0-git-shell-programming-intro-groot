#!/usr/bin/bash

NUMBER=$1

TARGET_DIR=$2

tar -xf NthPrime.tgz --directory $TARGET_DIR

cd $TARGET_DIR/NthPrime
gcc *.c -o NthPrime

./NthPrime $NUMBER


