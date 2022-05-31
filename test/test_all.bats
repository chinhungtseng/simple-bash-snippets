#!/usr/bin/env bats

setup() {
    load 'test_helper/common-setup'
    _common_setup

    source "$PROJECT_ROOT/src/color.sh"
}

@test "test setcolor" {
    capture_color() {
        setcolor
	echo "${Black}${Red}${Green}${Yellow}${Blue}${Purple}${Cyan}${White}${Norm}"
    }

    run capture_color
    assert_output '\033[0;30m\033[0;31m\033[0;32m\033[0;33m\033[0;34m\033[0;35m\033[0;36m\033[0;37m\033[0m'
}

@test "test unsetcolor" {
    color_wrapper() {
        setcolor
	unsetcolor
	echo "${Black}${Red}${Green}${Yellow}${Blue}${Purple}${Cyan}${White}${Norm}"
    }
    
    run color_wrapper
    assert_output ''
}
