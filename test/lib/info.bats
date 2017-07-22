#!/usr/bin/env bats

####################################################################################
# Bashlib     : 0.0.1
# Copyright		: 2017, MIT
# Author			: André Lademann <vergissberlin@googlemail.com>
# Repository	: https://github.com/vergissberlin/bashlib
####################################################################################

load "../test_helper"
load "../../lib/file"


setup() {
  mkdir -p ./test/results
  FILE_OLD="./test/fixtures/file-old.txt";
  FILE_NEW="./test/fixtures/file-new.txt"
}

@test "File - Old file info output" {
  run fileInfo $FILE_OLD
  assert_output --partial "file-old.txt"
}

@test "File - New file info output" {
  run fileInfo $FILE_NEW
  assert_output --partial "file-new.txt"
}
