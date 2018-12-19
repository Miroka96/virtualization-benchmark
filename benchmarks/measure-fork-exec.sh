#!/bin/bash -e

PIDC=2000
ITERC=100
EXECUTABLE="forksum"

if [ ! -e $EXECUTABLE ] ; then
	#echo "Compiling $EXECUTABLE.c"
	cc -O -o $EXECUTABLE $EXECUTABLE.c -lm
fi


TIMINGS=$((time (for i in $(seq $ITERC)
	do ./$EXECUTABLE 1 $PIDC > /dev/null
	done)) 2>&1 |
grep real |
sed "s/,/./g" |
egrep -o "[0-9,.]+")

T=0
for unit in $TIMINGS
do T=$(echo "$T $unit" | awk '{printf $1 * 60 + $2}')
done

echo $T
