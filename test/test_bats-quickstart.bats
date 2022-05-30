#!/usr/bin/env bats

setup() {
    load 'test_helper/common-setup'
    _common_setup
}

@test "can run our script" {
    # notice the missing ./
    # As we added src/ to $PATH, we can omit the relative path to `src/project.sh`.
    run bats-quickstart.sh
    assert_output --partial 'Welcome to our project!'
}

