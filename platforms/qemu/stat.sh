#!/bin/bash

make run 1>&2 &
while ! ping $(cat ip) -c 1 1>&2
do sleep 1
done

sleep 2

./run-command.sh "wget -O - http://$(cat ../native/ip)/performanceStats.sh 2>/dev/null | bash"
make shutdown 1>&2

wait
