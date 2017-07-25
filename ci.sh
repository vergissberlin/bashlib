#!/usr/bin/env bash

export CI=true
export TERM=xterm

echo
cat ./resource-bashlib/logo.txt
echo
figlet "Testing"
cd ./resource-bashlib/
sh ./test/suite.sh
