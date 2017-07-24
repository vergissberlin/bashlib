#!/usr/bin/env bash

apt update
apt install git -y
sh test/suite.sh
