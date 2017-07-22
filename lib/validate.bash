#!/usr/bin/env bash

####################################################################################
# Bashlib     : 0.0.1
# Copyright		: 2017, MIT
# Author			: André Lademann <vergissberlin@googlemail.com>
# Repository	: https://github.com/vergissberlin/bashlib
####################################################################################


# Check count of arguments
#
# @example validateArguments "24" "42" "12"
# @return void
function validateArguments {
	if [ $1 -ne $2 ]
	then
		messageError 65 $3
	fi
}

# Check count of arguments
#
# @example validateEnvironment ENV_VAR_NAME
# $1 Environment variable name
# @return void
function validateEnvironment {
	if printenv $1 >/dev/null
	then
        messageOk "Variable ${blue}${1}${norm} is set."
	else
        messageError 65 "Variable ${blue}${1}${norm} is not set."
	fi
}

# Check files exists
#
# @return string
function validateFile {
    if [ -f "$1" ]
    then
        messageOk "File ${code}$1${norm} exists."
    else
        messageError 128 "File ${code}$1${norm} not found."
    fi
}

# Check directory exists
#
# @return string
function validateDirectory {
    if [ -d "$1" ]
    then
        messageOk "Directory ${code}$1${norm} exists."
    else
        messageError 128 "Directory ${code}$1${norm} not exists."
    fi
}

# Check files exists on remote server
#
# @return string
function validateFileRemote {
    remote "if [ -f $1 ]; then echo 'File $1 exists.';else echo 'File $1 not found.';fi"
}

# Check container is up and running
#
# @return
function validateDockerContainer {
    if [[ $(docker ps -f "name=$1" --format '{{.Names}}') == $1 ]]
    then
        messageOk "Container ${code}$1${norm} is running."
    else
        messageError 1 "Container ${code}$1${norm} is not running."
    fi
}
