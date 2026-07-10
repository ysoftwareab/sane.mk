#!/usr/bin/env bats

setup() {
	cd "${BATS_TEST_DIRNAME}/.." || return 1
}


@test "make help succeeds and shows main targets" {
	run make help
	[ "$status" -eq 0 ]
	[[ "$output" == *"Main targets:"* ]]
}


@test "make help/all succeeds and shows all targets" {
	run make help/all
	[ "$status" -eq 0 ]
	[[ "$output" == *"Available targets:"* ]]
}
