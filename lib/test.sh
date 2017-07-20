#!/usr/bin/env bash

####################################################################################
# Bashlib     : 0.0.1
# Copyright		: 2017, MIT
# Author			: André Lademann <vergissberlin@googlemail.com>
# Repository	: https://github.com/vergissberlin/bashlight
####################################################################################


# Variables
ASSERTS=""
REPORTS=""
FAILED=""

## Output colors
RESET="\033[0m"
RED="\033[01;31m"
GREEN="\033[01;32m"
BLUE="\033[01;34m"

# Check file content from two given files
#
# @example testFileCompare /your/path/file1 /your/path/file2
# @return string
function testFileCompare {
    if [[ $(cat $1) == $(cat $2) ]]; then
        testSuccess
    else
        testFail "${1} $(cmp -b $1 $2)"
    fi
}

# Check file exists
#
# @example testFileExists /your/path/file
# @return string
function testFileExists {
    if [ -f "$1" ]; then
        testSuccess
    else
        testFail "${1}"
    fi
}

# Check file not exists
#
# @example testFileNotExists /your/path/file
# @return string
function testFileNotExists {
    if [ -f "$1" ]; then
        testFail "${1}"
    else
        testSuccess
    fi

}

# Check if given string exists in file
#
# @example testStringExistsInFile /your/path/file "your string"
# @return string
function testStringExistsInFile {
    if [[ $(cat $1) == *"$2"* ]]; then
        testSuccess
    else
        testFail "${1}"
    fi
}


# Check file has file type
#
# @example testFileType /your/path/file.txt "text/plain; charset=utf-8"
# @param string $1 /path/to/file.txt
# @param string $2 Output string
# @return string
function testFileType() {
    case "$OSTYPE" in
      darwin*)
        FILE_TYPE=$(file -bI $1)
        ;;
      linux*)
        FILE_TYPE=$(file -bi $1)
      ;;
      *)
        FILE_TYPE=$(file -bi $1)
        ;;
    esac

    if [[ ${FILE_TYPE} == $2 ]]; then
        testSuccess
    else
        testFail "Type of ${1} is not \"${2}\""
    fi
}


# Shortcut to testFileType to check file type UTF8
#
# @example testFileUTF8 /your/path/file.txt
# @param string $1 /path/to/file.txt
# @return string
function testFileUTF8() {
    testFileType $1 "text/plain; charset=utf-8"
}

# Report a failed assertions
#
# @return void
function testFail() {
    testReportAdd "${RED}F${RESET}"
    FAILED+="\t\t- ${1}\n"
    FAILED_GLOBAL+="\t\t- ${1}\n"
}

# Report a successful assertions
#
# @return void
function testSuccess() {
    testReportAdd "${GREEN}.${RESET}"
}

# Add report to test report list
#
# @return void
function testReportAdd() {
    REPORTS+="${1}"
    ASSERTS=$((ASSERTS + 1))
    ASSERTS_GLOBAL=$((ASSERTS_GLOBAL + 1))
}

# Print test report
#
# @return void
function testReportLocal() {
    echo -e "\n"
    echo -e "\t\t${BLUE}Reports:${RESET}\t${REPORTS}"
    echo -e "\t\t${BLUE}Assertions:${RESET}\t${ASSERTS}"
    if [ "${FAILED}" ]; then
        echo -e "\t\t${RED}✗ Failed${RESET}"
        echo -e "${FAILED}"
    else
        echo -e "\n\t\t${GREEN}✓ Success${RESET}\n"
    fi
}

# Print global test report and set exit code
#
# @return void
function testReportGlobal() {
    echo -e "\t\t${BLUE}Assertions:${RESET}\t${ASSERTS_GLOBAL}"
    if [ "${FAILED_GLOBAL}" ]; then
        echo -e "\t\t${RED}✗ Failed${RESET}"
        echo -e "${FAILED_GLOBAL}"
        exit 1
    else
        echo -e "\t\t${GREEN}✓ Success${RESET}\n"
        exit 0
    fi
    echo -e "\n"
}
