#!/bin/bash -e

PIDC=2000
ITERC=100
EXECUTABLE="forksum"

if [ ! -e $EXECUTABLE ] ; then
	#echo "Compiling $EXECUTABLE.c"
	cc -O -o $EXECUTABLE $EXECUTABLE.c -lm
fi


(time (for i in $(seq $ITERC)
	do ./$EXECUTABLE 1 $PIDC > /dev/null
	done)) 2>&1 |
grep real |
egrep -o "[0-9,]+" |
tail -n 1 |
sed "s/,/./g"
