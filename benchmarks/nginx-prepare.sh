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

dd if=/dev/random of=$OF bs=1M count=512
