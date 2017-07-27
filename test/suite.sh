#!/usr/bin/env bash

####################################################################################
# Bashlib     : 0.0.1
# Copyright		: 2017, MIT
# Author			: André Lademann <vergissberlin@googlemail.com>
# Repository	: https://github.com/vergissberlin/bashlib
####################################################################################


# Variabales
DIRECTORY_TEST="$(cd "$(dirname "$0")" && pwd)"
DIRECTORY_TEST_HELPER="${DIRECTORY_TEST}/test_helper"
BATS_EXECUTEABLE="${DIRECTORY_TEST_HELPER}/bats/libexec/bats"

# Install dependencies
echo "::: Install dependencies"
echo
if [ ! -e $BATS_EXECUTEABLE ]; then
	mkdir -p ${DIRECTORY_TEST_HELPER}/bats
	git clone --depth 1 https://github.com/sstephenson/bats ./test/test_helper/bats-source
	bash ${DIRECTORY_TEST_HELPER}/bats-source/install.sh ${DIRECTORY_TEST_HELPER}/bats
	rm -Rf ${DIRECTORY_TEST_HELPER}/bats-source
fi

[ ! -e $BATS_EXECUTEABLE ] && \
	git clone --depth 1 https://github.com/sstephenson/bats ./test/test_helper/bats
[ ! -e $DIRECTORY_TEST_HELPER/bats-support ] && \
	git clone --depth 1 https://github.com/ztombol/bats-support ./test/test_helper/bats-support
[ ! -e $DIRECTORY_TEST_HELPER/bats-assert ] && \
	git clone --depth 1 https://github.com/ztombol/bats-assert ./test/test_helper/bats-assert
[ ! -e $DIRECTORY_TEST_HELPER/bats-file ] && \
	git clone --depth 1 https://github.com/ztombol/bats-file ./test/test_helper/bats-file
echo

# Run all tests with bats
echo "::: Execute tests with bats"
echo
exec ${BATS_EXECUTEABLE} ${CI:+--tap} ${DIRECTORY_TEST}/lib
