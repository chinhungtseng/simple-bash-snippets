#!/bin/bash


DIR="$(realpath .)"

cleanup() {
    if [[ -d "$WORK_DIR" ]]; then
        echo rm -rf "$WORK_DIR"
        rm -rf "$WORK_DIR"
    fi
}

main() {
    trap cleanup EXIT

    WORK_DIR=$(mktemp -d -p "$DIR")
    
    if [[ ! "$WORK_DIR" || ! -d "$WORK_DIR" ]]; then
        echo "Could not create temporary directory"
        exit 1
    fi
    
    echo test > "$WORK_DIR/testfile"

    cat<"$WORK_DIR/testfile"
}

if [[ "${BASH_SOURCE[0]}" == "${0}" ]]; then
    main
fi
