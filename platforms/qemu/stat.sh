#!/bin/bash -e

ssh -i ../../ssh-key root@$(cat ip) "wget -O - http://$(cat ../native/ip)/performanceStats.sh 2>/dev/null | bash"
