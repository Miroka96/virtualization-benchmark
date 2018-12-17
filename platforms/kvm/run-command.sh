#!/bin/bash

ssh -i ../../ssh-key root@$(cat ip) $@