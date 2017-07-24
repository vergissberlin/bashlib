#!/usr/bin/env bash
apt-get update
apt-get install git-core bats -y

echo
cat ./resource-bashlib/logo.txt
echo
cd ./resource-bashlib/
sh ./test/suite.sh
