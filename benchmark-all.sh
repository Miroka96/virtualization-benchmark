#!/bin/bash -e

BASE=$(realpath $(dirname $(
	if which "$0" > /dev/null
	then which "$0"
	else "$0"
	fi
)))

for platform in $(ls -F $BASE/platforms | grep /)
do
	cd "$BASE/platforms/${platform}"
	if [ -e benchmark.sh ]
	then export CLOUD=$platform 
		./benchmark.sh
		echo "benchmarked ${platform%/}"
		mv $BASE/$platform-*.csv $BASE/platforms/$platform
	else echo "Missing benchmark.sh in platforms/$platform"
	fi
done
