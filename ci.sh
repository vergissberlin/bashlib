#!/usr/bin/env bash
apt-get update
apt-get install git-core bats -y
ls -lisah
cat ./resource-bashlib/logo.txt
sh ./resource-bashlib/test/suite.sh
