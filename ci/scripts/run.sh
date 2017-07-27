#!/usr/bin/env bash

export CI=true
export TERM=xterm

figlet "bashlib"
echo -e "\nRun tests on ${DISTRIBUTION}\n"
figlet -f digital "Run tests"
echo
echo $(uname -a)
echo

cd ./resource-bashlib/
sh ./test/suite.sh
