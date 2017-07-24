#!/usr/bin/env bash

apt update
apt install git-core -y
sh test/suite.sh
