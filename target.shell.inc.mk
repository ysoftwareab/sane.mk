# ------------------------------------------------------------------------------

.PHONY: bash
bash: ## Start a bash shell with make's environment.
	$(ECHO_INFO) "Starting a bash shell with make's environment..."
	$(ENV) bash


.PHONY: bash/%
bash/%:
	$(ENV) bash -c "$*"


.PHONY: shell
shell: ## Start a shell with make's environment.
	$(ECHO_INFO) "Starting a shell with make's environment..."
	$(SHELL_BAK)


.PHONY: shell/%
shell/%:
	$(SHELL_BAK) -c "$*"
