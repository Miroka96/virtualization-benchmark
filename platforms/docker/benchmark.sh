#!/bin/bash -e

docker build -t cpu_bench -f cpu.Dockerfile ../..
docker run --rm cpu_bench > docker-cpu.csv

docker build -t mem_bench -f mem.Dockerfile ../..
docker run --rm  mem_bench > docker-mem.csv

docker build -t disk-random_bench -f disk-random.Dockerfile ../..
docker run --rm  disk-random_bench > docker-disk-random.csv

docker build -t fork_bench -f fork.Dockerfile ../..
docker run --rm  fork_bench > docker-fork.csv

docker build -t nginx_bench -f nginx.Dockerfile ../..
CONTAINER=$(docker run -d --rm -p 8080:80/tcp nginx_bench)

OLDPWD=$(pwd)
cd ../../benchmarks
export CLOUD=docker
./measure-nginx.sh http://localhost:8080/big.data
mv docker-*.csv $OLDPWD
docker stop $CONTAINER

