#!/usr/bin/env bats

setup() {
    cd "${BATS_TEST_DIRNAME}/.." || return 1
}


@test "make dist generates distribution artifacts" {
    run make dist
    [ "$status" -eq 0 ]
    [ -f dist/sane.mk ]
    [ -f dist/sane.std.mk ]
    [ -f dist/sane.extra.mk ]
    [ -f dist/sane.tf.mk ]
}
