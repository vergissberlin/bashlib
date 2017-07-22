#!/usr/bin/env bash

####################################################################################
# Bashlib     : 0.0.1
# Copyright		: 2017, MIT
# Author			: André Lademann <vergissberlin@googlemail.com>
# Repository	: https://github.com/vergissberlin/bashlib
####################################################################################


# Variables defaults
VERBOSE=false

# Options
while getopts ":d:e:f:t:v" opt; do
  case ${opt} in
    d)
      NOW=$OPTARG
      ;;
    e)
      ENV=$OPTARG
      ;;
    f)
      FILENAME=$OPTARG
      ;;
    t)
      TARGET=$OPTARG
      ;;
    v)
      VERBOSE=true
      ;;
    \?)
      echo "Invalid option: -$OPTARG" >&2
      exit 1
      ;;
    :)
      echo "Option -$OPTARG requires an argument." >&2
      exit 1
      ;;
  esac
done
