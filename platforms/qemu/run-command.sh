#!/bin/bash

while ! nc -z $(cat ip) 22
do sleep 1
done

ssh -i ../../ssh-key root@$(cat ip) $@
