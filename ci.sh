#!/usr/bin/env bash
apt-get update
apt-get install git-core -y
ls -lisah
cat ./resource-bashlib/logo.txt
sh ./resource-bashlib/test/suite.sh
