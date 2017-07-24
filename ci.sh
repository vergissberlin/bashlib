#!/usr/bin/env bash
apt-get update
apt-get install git-core -y
sh ./test/suite.sh
