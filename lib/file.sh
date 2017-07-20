#!/usr/bin/env bash

####################################################################################
# Bashlib     : 0.0.1
# Copyright		: 2017, MIT
# Author			: André Lademann <vergissberlin@googlemail.com>
# Repository	: https://github.com/vergissberlin/bashlight
####################################################################################


# Get file information
#
# @example infoFile "path/to/file.xx"
#
# return string
function fileInfo() {
    ls -lh $1 | indent
}
