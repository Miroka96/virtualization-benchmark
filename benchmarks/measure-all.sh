#!/bin/bash

cd $(realpath $(dirname $0))

CPU=$(time ./measure-cpu.sh)
echo "CPUTS=$(date +%s)"
echo "CPU=$CPU"

RAM=$(time ./measure-mem.sh)
echo "MEMTS=$(date +%s)"
echo "MEM=$RAM"

IOR=$(time ./measure-disk-random.sh)
echo "DISKTS=$(date +%s)"
echo "DISK=$IOR"

FORK=$(time ./measure-fork.sh)
echo "FORKTS=$(date +%s)"
echo "FORK=$FORK"

NGINX=$(time ./measure-nginx.sh)
echo "NGINXTS=$(date +%s)"
echo "NGINX=$NGINX"
