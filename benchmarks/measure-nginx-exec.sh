#!/bin/bash -e

if [ -z "$1" ]
then URL="http://localhost/big.data"
else URL="$1"
fi

if [ -z "$2" ]
then THREADS=2
else THREADS="$2"
fi

if which wget > /dev/null
then DOWNLOADER="wget -O /dev/null '$URL'"
elif which curl > /dev/null
then DOWNLOADER="curl '$URL' > /dev/null"
else
	echo "Missing wget and/or curl"
	exit 1
fi

for i in $(seq $THREADS)
do $DOWNLOADER 2> /dev/null &
done
wait
