#!/bin/bash

######################################################################
# Display spinner status
# Usage:
#   First, you must send you program into background, then call the
#   spinner function with last program's PID.
#   > prog &
#   > spinner $!
# Arguments:
#   PID: the PID of the last program run in the background.
# Example:
#   sleep 10 &
#   spinner $!
######################################################################
spinner() {
    # shellcheck disable=SC1003
    local spin=('|' '/' '-' '\')
    local waittime=0.2
    local pid="$1"

    echo -en "${2:- } "

    while kill -0 "$pid" 2>/dev/null; do
        for i in "${spin[@]}"; do
            echo -en "\b$i"
            sleep ${waittime}
        done
    done
    wait "$pid"
    return $?
}

