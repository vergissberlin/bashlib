#!/usr/bin/env bash

####################################################################################
# Bashlib     : 0.0.1
# Copyright		: 2017, MIT
# Author			: André Lademann <vergissberlin@googlemail.com>
# Repository	: https://github.com/vergissberlin/bashlib
####################################################################################

# Calculate two variables
#
# @example calc "${var}/1024"
# $1 Calculation string
# @return string result
function mathCalc() {
    awk "BEGIN { print "$*" }"
}

# Round a float to integer
#
# @example round "1.25"
# $1 Float number
# $2 Count of dicimals
# @return string result
function mathRound() {
    if [ ! $2 ]
    then
      local decimal=0;
    else
      local decimal=$2;
    fi
    echo $1 | LC_ALL=C xargs /usr/bin/printf "%.*f\n" $decimal
}
