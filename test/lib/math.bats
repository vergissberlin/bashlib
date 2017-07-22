#!/usr/bin/env bats

####################################################################################
# Bashlib     : 0.0.1
# Copyright		: 2017, MIT
# Author			: André Lademann <vergissberlin@googlemail.com>
# Repository	: https://github.com/vergissberlin/bashlib
####################################################################################

load "../test_helper"
load "../../lib/math"

@test "Math - Calculate 1+1=2" {
  run mathCalc "1+1"
  assert_output 2
}

@test "Math - Calculate 1+1=2 without quotes" {
  run mathCalc 1+1
  assert_output 2
}

@test "Math - Calculate 1/1=1" {
  run mathCalc "1/1"
  assert_output 1
}

@test "Math - Calculate 1-5=-4" {
  run mathCalc "1-5"
  assert_output -4
}

@test "Math - Calculate -12*-12=144" {
  run mathCalc "-12*-12"
  assert_output 144
}

@test "Math - Calculate 6+12*12=150" {
  run mathCalc 6+12*12
  assert_output 150
}

@test "Math - Round to lower" {
  run mathRound 1.25 0
  assert_output 1
}

@test "Math - Round to higher" {
  run mathRound 1.51 0
  assert_output 2
}

@test "Math - Round with default decimal" {
  run mathRound 1.25
  assert_output 1
}
