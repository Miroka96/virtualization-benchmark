#!/bin/bash -e

docker build -t stat_bench -f stat.Dockerfile ../.. 1>&2
docker run --rm stat_bench
#docker run --rm -it debian:stable /bin/bash -c "wget -O - http://$(cat ../native/ip)/performanceStats.sh 2>/dev/null"
