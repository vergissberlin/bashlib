#!/usr/bin/env b.bash

####################################################################################
# Bashlib       : 0.0.1
# Copyright     : 2017, MIT
# Author        : André Lademann <vergissberlin@googlemail.com>
# Repository    : https://github.com/vergissberlin/bashlib
####################################################################################


# Include variables
source .env

# Hooks
source ./hooks/ctrl_c.bash

# Include libraries
source ./lib/file.bash
source ./lib/math.bash
source ./lib/message.bash
source ./lib/options.bash
source ./lib/remote.bash
source ./lib/spinner.bash
source ./lib/validate.bash
