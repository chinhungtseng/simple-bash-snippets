#!/bin/bash

######################################################################
# Check script run as root user,
# Arguments:
#   None
# Returns:
#   0 if script run as root user, otherwise return 1.
######################################################################
root_privileges() {
    if [[ $(id -u) -ne 0 ]]; then
        return 1
    fi
}

