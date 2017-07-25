#!/usr/bin/env bash

export CI=true
export TERM=xterm

echo
cat ./resource-bashlib/logo.txt
echo
cd ./resource-bashlib/
sh ./test/suite.sh
