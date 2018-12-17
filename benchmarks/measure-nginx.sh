#!/bin/bash

echo "let nginx build the cache" >&2
time ${0%.sh}-exec.sh $@ > /dev/null

# run the benchmark
./measure-generic.sh "" "${0%.sh}-exec.sh" "nginx" 5 $@
