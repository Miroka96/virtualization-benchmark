#!/bin/bash

EXECUTABLE="linpack"

if [ ! -e $EXECUTABLE ] ; then
	#echo "Compiling $EXECUTABLE.c"
	cc -O -o $EXECUTABLE $EXECUTABLE.c -lm
fi

./$EXECUTABLE
