#!/usr/bin/env bash
apt-get update
apte-get install bats git-core

export CI=true
export TERM=xterm

echo
cat ./resource-bashlib/logo.txt
echo
cd ./resource-bashlib/
sh ./test/suite.sh
