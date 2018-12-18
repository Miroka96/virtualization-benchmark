#!/bin/bash

make run 1>&2 &
while ! ping $(cat ip) -c 1 1>&2
do sleep 1
done

for file in $(ls ../../benchmarks/)
do 	sudo cp ../../benchmarks/$file /var/www/html/
	./run-command.sh "wget -O $file http://$(cat ../native/ip)/$file 2>/dev/null && chmod +x $file"
done

./run-command.sh "./nginx-prepare.sh"

CLOUD=${PWD##*/}
IP=$(cat ip)

./run-command.sh "export CLOUD=$CLOUD && ./measure-all.sh"
for result in $(./run-command.sh "ls $CLOUD-*.csv")
do scp -i ../../ssh-key root@$(cat ip):$result .
done

OLDPWD=$(pwd)
cd ../../benchmarks
export CLOUD
./measure-nginx.sh http://$IP/big.data
mv $CLOUD-*.csv $OLDPWD

cd $OLDPWD
make shutdown 1>&2
wait
