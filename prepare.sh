#!/bin/bash

DEPENDENCIES="gcc fio nginx openssh-server sudo"

if which apt > /dev/null
then INSTALLER=apt
elif which apt-get > /dev/null
then INSTALLER=apt-get
else echo "Missing supported installer. Install the dependencies yourself!"
fi

sed -i 's/\(^[^#]*cdrom\)/# \1/g' /etc/apt/sources.list

$INSTALLER update
$INSTALLER install -y $DEPENDENCIES

SSHKEY="
ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQC+jfIHpjvJ8NK8evev/ArrsRaYM8Y9+wdoNwyl+M9WYVQtxjhds+zTN/bBzZhdygX3UBn+vVfsB9SkXm3kmW1Hjm0c2yu6j94nZ7CATvLQUF0ndFkRsf4iBBq7Nxa4BZqN2W1VoL0b129mojuOu+xMySoDc+p0QsM+whqrCr1C/gGOLLS+n/70Vr/JT0VV3SsAPF2A6edlLvzZyjO2ibdA9eYQI4q84CHI7eO4h8Xp1xn8e+3jin536F1ErXnjmBX7y13joGiDCUV5lEktykAK4eXoUeONi9Dd+5DFaWNdem8/fKlmrqYvi/dWwk02T/dTGXisJgYBaz32jXchQkSn meth@tiger
"

mkdir -p ~/.ssh
touch ~/.ssh/authorized_keys
echo $SSHKEY >> ~/.ssh/authorized_keys
