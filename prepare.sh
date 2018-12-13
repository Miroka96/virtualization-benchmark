#!/bin/bash

DEPENDENCIES="gcc fio nginx"

if which apt > /dev/null
then INSTALLER=apt
elif which apt-get > /dev/null
then INSTALLER=apt-get
else echo "Missing supported installer. Install the dependencies yourself!"
fi

$INSTALLER update
$INSTALLER install -y $DEPENDENCIES

