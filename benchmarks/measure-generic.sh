#!/bin/bash

USAGE="$0 <cloud> <executable> <benchmarktype>"

if ([ -z "$1" ] && [ -z "$CLOUD" ]) || [ -z "$2" ] || [ -z "$3" ] ; then
	echo $USAGE
	echo "Cloud parameter will be overwritten by environment variable CLOUD"
	exit 1
fi

if [ -z "$CLOUD" ]
then CLOUD=$1
fi

EXECUTABLE=$2
CSV="$CLOUD-$3.csv"

if [ -e $CSV ]
then rm $CSV
fi

echo "time,value" > $CSV

for i in $(seq 48)
do echo "$(date +%s),$(time $EXECUTABLE)" | tee -a $CSV
done
