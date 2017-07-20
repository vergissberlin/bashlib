#!/usr/bin/env bash

####################################################################################
# Bashlib     : 0.0.1
# Copyright		: 2017, MIT
# Author			: André Lademann <vergissberlin@googlemail.com>
# Repository	: https://github.com/vergissberlin/bashlight
####################################################################################


# trap ctrl-c and call ctrl_c()
trap ctrl_c INT
function ctrl_c() {
    spinner_stop $?
    messageWarn "${bold_begin}${blink_begin}You have interrupt the process!${blink_end}${bold_end}\n        This could causes invalid data.\n"
    exit 1;
}

# Configuration
SPINNER_TIMER=true
