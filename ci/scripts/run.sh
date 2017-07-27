#!/usr/bin/env bash

export CI=true
export TERM=xterm

figlet "bashlib"
echo
figlet -f digital $DISTRIBUTION
echo
figlet -f digital "Run tests"
echo
echo $(uname -a)
echo

cd ./resource-bashlib/
sh ./test/suite.sh
