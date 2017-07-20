#!/usr/bin/env bash

####################################################################################
# Bashlib     : 0.0.1
# Copyright		: 2017, MIT
# Author			: André Lademann <vergissberlin@googlemail.com>
# Repository	: https://github.com/vergissberlin/bashlight
####################################################################################



# Colour definitions
red='\033[01;31m'
blue='\033[0;34m'
green='\033[01;32m'
yellow='\033[0;33m'
orange='\033[38;5;;172m'
norm='\033[0m'
code='\033[40m'

# Styling definitions
bold_begin='\033[1m'
bold_end='\033[21m'
underline_begin='\033[34;4m'
underline_end='\033[24m'
blink_begin='\033[33;5m'
blink_end='\033[0m'

# Message
function message() {
    echo -e "\r[${1}]\t\t${2}"
}

function messageError {
    message "${red}erro${norm}" "${@:2}"
    spinner_stop $?
	exit $1
}

function messageWarn {
	message "${yellow}warn${norm}" "$*"
}

function messageOk {
	message "${green} ok ${norm}" "$*"
}

function messageInfo {
	message "${blue}info${norm}" "$*"
}

function messageCode {
	message "${yellow}code${norm}" "${code}$*${norm}"
}

function messageHeader {
    echo -e "\n${blue}-----------------------------------------------------------------------------------------------------------${norm}"
	echo -e "::::\t$*"
    echo -e "${blue}-----------------------------------------------------------------------------------------------------------${norm}\n"
}

function messageMissingDirectory() {
    messageWarn "Directory not found."
}

function messageMissingFile() {
    messageWarn "File not found: ${code} ${1} ${norm}"
}

function messageMissingFileList() {
    messageInfo "Use one of the following file names:"
    if [[ ${ENV} ]]; then
        ls -lish ${1} | grep --color=always ${ENV}  | indent
    else
        ls -lish ${1} | indent
    fi
}

function messageMissingTask() {
    messageWarn "Please set one of the following ${blue}TASK${norm}s."
    messageInfo "Please run: ${code}make ${1} TASK=[VALUE]${norm}."
    if [ -z "${2}" ]; then
        messageInfo "${bold_begin}Available tasks:${norm}"
        echo -e "${2}"
    fi
}
