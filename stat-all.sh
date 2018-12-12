#!/bin/bash -e

if [[ "${0%/*}" == "/*" ]]
then BASE="${0%/*}"
else BASE="$(pwd)"
fi

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
