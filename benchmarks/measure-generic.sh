#!/bin/bash

if ([ -z "$1" ] && [ -z "$CLOUD" ]) || [ -z "$2" ] || [ -z "$3" ] || [ -z "$4" ] ; then
	echo "$0 <cloud> <executable> <benchmarktype> <delay>"
	echo "Cloud parameter will be overwritten by environment variable CLOUD"
	exit 1
fi

if [ -z "$CLOUD" ]
then CLOUD=$1
fi

EXECUTABLE=$2
CSV="$CLOUD-$3.csv"
DELAY=$4

if [ -e $CSV ]
then rm $CSV
fi

echo "time,value" | tee $CSV

for i in $(seq 48)
do echo "$(date +%s),$(time $EXECUTABLE ${@:5})" | tee -a $CSV
sleep $DELAY
done
