#!/bin/bash

######################################################################
# Prompt user for confirmation.
# Usage:
#   confirm [TEXT]
# Arguments:
#   TEXT: Optional text.
# Returns:
#   0 if user input y or yes, otherwise return 1.
# Example:
#   confirm "Are you sure"
######################################################################
confirm() {
    read -r -p "${1:-Continue?} [y/N]? " response
    if [[ ! "$response" =~ ^([yY][eE][sS]|[yY])$ ]]; then
        return 1
    fi
}

