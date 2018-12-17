#!/bin/bash -e

docker build -t stat_bench -f stat.Dockerfile ../.. 1>&2
docker run --rm stat_bench
