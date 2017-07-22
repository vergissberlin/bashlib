#!/usr/bin/env bash

####################################################################################
# Bashlib     : 0.0.1
# Copyright		: 2017, MIT
# Author			: André Lademann <vergissberlin@googlemail.com>
# Repository	: https://github.com/vergissberlin/bashlib
####################################################################################


# Include variables
source .env

# Hooks
source ./hooks/ctrl_c.sh

# Include libraries
source ./lib/file.sh
source ./lib/math.sh
source ./lib/message.sh
source ./lib/options.sh
source ./lib/remote.sh
source ./lib/spinner.sh
source ./lib/validate.sh
