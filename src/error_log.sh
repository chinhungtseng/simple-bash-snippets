#!/bin/bash

######################################################################
# Redirect message to standard error.
# Usage:
#   err [-d] MESSAGE
# Arguments:
#   -d: show date-time and MESSAGE
# Example:
#   > err "Error, Please..."
#   > Error, Please...
#
#   > err -d "Sorry, invalid operation"
#   > [2021-09-15T16:32:51]: Sorry, invalid operation
######################################################################
err() {
    local date_time=''

    if [[ $1 == "-d" ]]; then
        date_time="[$(date +'%Y-%m-%dT%H:%M:%S')]: "
        shift
    fi

    echo "${date_time}${*}" >&2
}

