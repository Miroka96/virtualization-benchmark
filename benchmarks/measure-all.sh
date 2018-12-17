#!/bin/bash

cd $(realpath $(dirname $0))

time ./measure-cpu.sh
time ./measure-mem.sh
time ./measure-disk-random.sh
time ./measure-fork.sh
echo "run the NGINX benchmark from your host: ./measure-nginx.sh <URL>" >&2
ifconfig >&2
