#!/bin/bash

if ! which nginx > /dev/null ; then
	if ! which apt > /dev/null
	then INSTALLER=apt
	elif ! which apt-get > /dev/null
	then INSTALLER=apt-get
	else echo "missing supported installer" && exit 1
	fi
	$INSTALLER install -y nginx
fi

DATAFILE=/var/www/html/big.data

dd if=/dev/urandom of=$DATAFILE bs=64M count=8 iflag=fullblock
