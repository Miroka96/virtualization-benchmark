#!/bin/bash
docker build -t cpu_bench -f cpu.Dockerfile ../.. &&
docker build -t mem_bench -f mem.Dockerfile ../.. &&
docker build -t disk-random_bench -f disk-random.Dockerfile ../.. &&
docker build -t fork_bench -f fork.Dockerfile ../.. &&
docker build -t nginx_bench -f nginx.Dockerfile ../.. &&
docker run cpu_bench > docker-cpu.csv &&
docker run mem_bench > docker-mem.csv &&
docker run disk-random_bench > docker-disk-random.csv &&
docker run fork_bench > docker-fork.csv &&
docker run -p 8080:80/tcp nginx_bench > docker-nginx.csv


