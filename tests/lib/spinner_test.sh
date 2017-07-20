#!/usr/bin/env bash

####################################################################################
# Bashlib     : 0.0.1
# Copyright		: 2017, MIT
# Author			: André Lademann <vergissberlin@googlemail.com>
# Repository	: https://github.com/vergissberlin/bashlight
####################################################################################


# Include libraries
. ./bashlib.sh
. ./lib/test.sh

# Headline
messageHeader "Test spinner"


. "lib/spinner.sh"
# test without timer
spinner_start 'Without timer sleeping for 2 secs...'
sleep 2
spinner_stop $?

# Activate timer
SPINNER_TIMER=true

# test success
spinner_start 'Sleeping for 2 secs...'
sleep 2
spinner_stop $?

# test fail
spinner_start 'Copying non-existing files...'
# use sleep to give spinner time to fork and run
# because cp fails instantly
sleep 1
cp 'file1' 'file2' > /dev/null 2>&1
spinner_stop $?

# test success
spinner_start 'Sleeping for 70 seconds ...'
sleep 70
spinner_stop $?
