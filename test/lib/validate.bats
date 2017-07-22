#!/usr/bin/env bats

####################################################################################
# Bashlib     : 0.0.1
# Copyright		: 2017, MIT
# Author			: André Lademann <vergissberlin@googlemail.com>
# Repository	: https://github.com/vergissberlin/bashlib
####################################################################################

load "../test_helper"

load "../../lib/validate"
load "../../lib/message"
load "../../lib/spinner"

function setup {
  export TEST_VAR_POSITIVE="test"
}

function after {
  unset TEST_VAR_POSITIVE
}

@test "Validate - compare two equal integer values is success" {
  run validateArguments 1 1
  assert_success
}

@test "Validate - compare two equal string values is success" {
  run validateArguments "a" "a"
  assert_success
}

@test "Validate - compare one integer and one string values is success" {
  run validateArguments 1 "1"
  assert_success
}

@test "Validate - compare two different values is failure" {
  run validateArguments 1 2
  assert_failure 1
}

@test "Validate - compare two inverse values is failure" {
  run validateArguments 1 -1
  assert_failure 1
}

@test "Validate - enviroment variable is set" {
  run validateEnvironment TEST_VAR_POSITIVE
  assert_success
}

@test "Validate - enviroment variable is not set" {
  run validateEnvironment TEST_VAR_NEGATIVE
  assert_failure 1
}

@test "Validate - file exists" {
  run validateFile "./test/fixtures/file-old.txt"
  assert_success
}

@test "Validate - file not exists" {
  run validateFile "./foo.txt"
  assert_failure 1
}

@test "Validate - file is not a directory" {
  run validateFile "./test/fixtures/"
  assert_failure 1
}

@test "Validate - directory exists" {
  run validateDirectory "./test/fixtures/"
  assert_success
}

@test "Validate - directory not exists" {
  run validateDirectory "./test/foo/"
  assert_failure
}

@test "Validate - directory is not a file" {
  run validateDirectory "./test/fixtures/file-old.txt"
  assert_failure
}
