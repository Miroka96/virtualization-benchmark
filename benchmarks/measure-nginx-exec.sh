#!/bin/bash -e

URL="http://localhost/big.data"
THREADS=16
ITERATIONS=1


if ! [ -z "$1" ]
then URL="$1"
fi

if ! [ -z "$2" ]
then THREADS="$2"
fi

if which wget > /dev/null
then DOWNLOADER="wget -O /dev/null '$URL'"
elif which curl > /dev/null
then DOWNLOADER="curl '$URL' > /dev/null"
else
	echo "Missing wget and/or curl"
	exit 1
fi

(time (for i in $(seq $THREADS)
do sh -c "for j in \$(seq $ITERATIONS); do $DOWNLOADER 2> /dev/null ; done" &
done
wait
)) 2>&1 |
grep real |
egrep -o "[0-9,.]+" |
tail -n 1 |
sed "s/,/./g"

