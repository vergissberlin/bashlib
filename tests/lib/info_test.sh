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
messageHeader "Test file info"

# Variables
FILE_OLD="./tests/fixtures/file-old.txt"
FILE_NEW="./tests/fixtures/file-new.txt"

# Preparation
function setup {
	echo ""
}

function teardown {
	echo ""
}


# Tests


# Test file information
#
# @return void
function test_information() {

    messageInfo "Test information"

		# fileInfo ${FILE_OLD} == "- rw - r-- r-- 1 andrelademann staff 0 B 12 Jan 2000./ tests / fixtures / file - old.txt"
}


# Test file content
#
# @return void
function test_content() {

    messageInfo "Test file content of fixtures"

    testStringExistsInFile \
        "./tests/fixtures/file-new.txt" \
        "new"

    testStringExistsInFile \
        "./tests/fixtures/file-old.txt" \
        "old"

}

# Test runner
setup

# test_information
test_content


# Print report
testReportLocal

teardown
