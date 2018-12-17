#!/bin/bash

cd ../../benchmarks/

if [ -z "$CLOUD" ]
then export CLOUD=native
fi

./measure-all.sh
./measure-nginx.sh
