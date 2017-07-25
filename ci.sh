#!/usr/bin/env bash

export CI=true
export TERM=xterm

figlet "bashlib"
echo
figlet -f digital "Run tests"

cd ./resource-bashlib/
sh ./test/suite.sh
