#!/bin/bash

######################################################################
# Check all arguments (commands) exist or not.
# Usage:
#   check_required_commands arg1 [arg2] [arg3] [...]
# Arguments:
#   args: a list of commands seperated by space.
# Returns:
#   0 if all input arguments exist, non-zero on not exist.
# Outputs:
#   command exist or not exist status.
# Example:
#   check_required_commands mt lsscsi
#
#   Check commands:
#   mt:     exist
#   lsscsi: exist
######################################################################
check_required_commands() {
    COUNT=0

    if [[ "${#@}" -eq 0 ]]; then
        echo "Required at least one argument." >&2
        return 1
    fi

    echo "Check commands:"

    for cmd in "${@}"; do
        echo -en "\t$cmd:"
        if command -v "$cmd" &>/dev/null; then
            ((COUNT++))
            echo -e '\t\033[0;32mexist\033[0m'
        else
            echo -e '\t\033[0;31mnot found\033[0m'
        fi
    done

    if [[ "$COUNT" -ne "${#@}" ]]; then
        echo "Please installed required commands first!" >&2
        return 1
    fi
}

