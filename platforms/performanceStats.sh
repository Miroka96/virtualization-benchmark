#!/bin/bash -e

if ! which smartctl > /dev/null
then sudo apt-get install smartmontools
fi

echo "####################"
echo "###### CPUINFO #####"
echo "####################"
cat /proc/cpuinfo | head -n 26
echo

echo "####################"
echo "###### CPU DEV #####"
echo "####################"
sudo dmidecode --type 4
echo

echo "####################"
echo "###### MEMINFO #####"
echo "####################"
cat /proc/meminfo
echo

echo "####################"
echo "###### MEM DEV #####"
echo "####################"
sudo dmidecode --type 17
echo

echo "####################"
echo "###### HDD DEV #####"
echo "####################"
echo
for dev in $(ls /dev/sd?); do
	echo "###### $dev ####"
	sudo smartctl -i $dev
	echo
done
echo

echo "####################"
echo "###### OS RLSE #####"
echo "####################"
echo
for rel in $(ls --file-type -d /etc/*release* | grep -v /$ | grep -o "[^@]*"); do
	echo "###### $rel ####"
	cat $rel
	echo
done
echo

echo "####################"
echo "###### KERNEL ######"
echo "####################"
uname -a
echo
