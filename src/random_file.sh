#!/bin/bash

######################################################################
# Create random content file.
# Usage:
#   random_file FILE SIZE
# Arguments:
#   FILE: output file path, a path.
#   SIZE: output file size.
# Returns:
#   0 if file was created, non-zero on error.
# Example:
#   # Create a file with size of 5M.
#   random_file "/tmp/sample-file.txt" 5M
######################################################################
random_file() {
    echo -en "Rendering file $1 with size $2...  "

    spin &
    spin_pid=$!
    trap 'kill $spin_pid 2> /dev/null' RETURN

    if [[ "$#" -ne 2 ]]; then
        echo -e "\berror"
        echo "Invalid argument numbers." >&2
        return 1
    fi

    dd if=/dev/urandom of="$1" bs="$2" count=1 iflag=fullblock >/dev/null 2>&1

    local res="$?"
    if [[ "$res" -ne 0 ]]; then
        echo -e "\berror"
        echo "Cannot create a random content file." >&2
        return 1
    fi

    echo -e "\bdone"
}

