#!/usr/bin/env bats

####################################################################################
# Bashlib     : 0.0.1
# Copyright		: 2017, MIT
# Author			: André Lademann <vergissberlin@googlemail.com>
# Repository	: https://github.com/vergissberlin/bashlib
####################################################################################

load "../test_helper"
load "../../lib/message"

@test "Message - Simple message" {
  run message "Hello world"
  assert_success
}

@test "Message - Error message with exit code" {
  run messageError 100 "Hello world"
  assert_failure
}
