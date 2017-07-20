#!/usr/bin/env bash

####################################################################################
# Bashlib     : 0.0.1
# Copyright		: 2017, MIT
# Author			: André Lademann <vergissberlin@googlemail.com>
# Repository	: https://github.com/vergissberlin/bashlight
####################################################################################



# Setup
. ./tests/test_start.sh

# Include test cases
. ./tests/lib/*_test.sh

# Tear down
. ./tests/test_stop.sh
