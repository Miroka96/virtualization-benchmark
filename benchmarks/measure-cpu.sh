#!/bin/bash

EXECUTABLE="linpack"
CSV="cpu.csv"

if [ -z "$CLOUD" ]
then echo "Specify environment variable CLOUD" >&2
else CSV="$CLOUD-$CSV"
fi

if [ -e $CSV ]
then rm $CSV
fi

if [ ! -e $EXECUTABLE ] ; then
	#echo "Compiling linpack.c"
	cc -O -o linpack linpack.c -lm
fi

echo "time,value" > $CSV

for i in $(seq 48)
do echo "$(date +%s),$(time ./$EXECUTABLE)" | tee -a $CSV
done
