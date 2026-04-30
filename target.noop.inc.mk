# noop TARGET
# Usage:
# my-target: my-optional-target | noop
.PHONY: noop
noop:
	@:

# noop/% TARGET
# Usage:
# my-target: noop/my-optional-target
.PHONY: noop/%
noop/%:
	@$(ECHO_INFO) "Skipping $*..."
	@:

# skip/% TARGET, alias to noop/%
# Usage:
# my-target: skip/my-optional-target
.PHONY: skip/%
skip/%:
	@$(ECHO_INFO) "Skipping $*..."
	@:
