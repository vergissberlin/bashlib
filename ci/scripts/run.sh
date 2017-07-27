#!/usr/bin/env bash

export CI=true
export TERM=xterm

figlet "bashlib"
figlet -f digital "Run tests"

echo "\n\nRun tests on: ${DISTRIBUTION}"
echo "$(uname -a)\n"

cd ./resource-bashlib/
sh ./test/suite.sh
