#!/bin/bash -e

BASE=$(realpath $(dirname $(
	if which "$0" > /dev/null
	then which "$0"
	else "$0"
	fi
)))

OUT="$BASE/environment.txt"

if [ -e $OUT ]
then rm $OUT
fi

touch $OUT

for platform in $(ls -F platforms | grep /)
do
	cd "$BASE/platforms/${platform}"
	if [ -e stat.sh ]
	then	echo "##############################" >> $OUT
		echo "########## ${platform%/} ###########" >> $OUT
		echo "##############################" >> $OUT
		echo >> $OUT
		./stat.sh >> $OUT
		echo >> $OUT
		echo "statted ${platform%/}"
	else echo "Missing stat.sh in platforms/$platform"
	fi
done
