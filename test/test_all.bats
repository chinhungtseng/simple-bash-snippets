#!/usr/bin/env bats

setup() {
    load 'test_helper/common-setup'
    _common_setup

    source "$PROJECT_ROOT/src/color.sh"
    source "$PROJECT_ROOT/src/confirm.sh"
    source "$PROJECT_ROOT/src/random_file.sh"
    source "$PROJECT_ROOT/src/check_required_commands.sh"
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

@test "test confirm" {
    run confirm<<<"yes"
    assert_success

    run confirm<<<""
    assert_failure

    run confirm<<<"no"
    assert_failure
}

teardown() {
    random_file_name=random_file_sample.txt
    if [[ -f "$random_file_name" ]]; then
        rm -f "$random_file_name"
    fi
}

@test "test random_file is work" {
    run random_file random_file_sample.txt 5M
    assert_success
    assert_output --partial 'done'
}

@test "test random_file without parameter" {
    run random_file
    assert_failure
    assert_output --partial 'Invalid argument numbers.'
}

@test "test random_file with one parameter" {
    run random_file random_file_sample.txt
    assert_failure
    assert_output --partial 'Invalid argument numbers.'
}

@test "test random_file with three parameter" {
    run random_file random_file_sample.txt 5M ErrorParam
    assert_failure
    assert_output --partial 'Invalid argument numbers.'
}

@test "test check_required_commands with one parameter" {
    run check_required_commands ls
    assert_success
    assert_output --partial 'Check commands'
}
    
@test "test check_required_commands with many parameter" {
    run check_required_commands ls id pwd env
    assert_success
    assert_output --partial 'Check commands'
}

@test "test check_required_commands with not exist command" {
    run check_required_commands ls NotExistCommand
    assert_failure
    assert_output --partial 'Please installed required commands first!'
}

@test "test check_required_commands without parameter" {
    run check_required_commands
    assert_failure
    assert_output --partial 'Required at least one argument.'
}

