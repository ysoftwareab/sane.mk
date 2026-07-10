#!/usr/bin/env bats

setup() {
    cd "${BATS_TEST_DIRNAME}/.." || return 1
}


@test "Brewfile # source expansion inlines brew/*.brew files" {
    run make debug/brewfile/cat
    [ "$status" -eq 0 ]
    [[ "$output" == *'brew "git"'* ]]
    [[ "$output" != *"# source brew/core.brew"* ]]
}
