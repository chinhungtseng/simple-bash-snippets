#!/bin/bash

######################################################################
# Set color variables for printing a colored output.
# Arguments:
#   None
# Example:
#   # call setcolor function.
#   setcolor
#
#   echo "${Red}Red line.${Norm}"
#   echo "${Green}Green line.${Norm}"
#
######################################################################
# shellcheck disable=SC2034 # Unused variables left for set text color
setcolor() {
    Black='\033[0;30m'
    Red='\033[0;31m'
    Green='\033[0;32m'
    Yellow='\033[0;33m'
    Blue='\033[0;34m'
    Purple='\033[0;35m'
    Cyan='\033[0;36m'
    White='\033[0;37m'
    Norm='\033[0m'
}

######################################################################
# Set color variables to None.
# Arguments:
#   None
######################################################################
unsetcolor() {
    Black=''
    Red=''
    Green=''
    Yellow=''
    Blue=''
    Purple=''
    Cyan=''
    White=''
    Norm=''
}

