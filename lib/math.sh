#!/usr/bin/env bash

####################################################################################
# Bashlib     : 0.0.1
# Copyright		: 2017, MIT
# Author			: André Lademann <vergissberlin@googlemail.com>
# Repository	: https://github.com/vergissberlin/bashlight
####################################################################################

# Calculate two variables
#
# @example calc "${var}/1024"
# @return string result
function calc() {
    awk "BEGIN { print "$*" }"
}


# Round a float to integer
#
# @example round "1.25"
# @return string result
function round() {
    echo $(printf %.$2f $(echo "scale=$2;(((10^$2)*$1)+0.5)/(10^$2)" | bc))
}
