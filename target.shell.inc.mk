SHELL_ENV ?=

# ------------------------------------------------------------------------------

.PHONY: bash
bash: ## Start a bash shell with make's environment.
	$(ECHO_INFO) "Starting a bash shell with make's environment..."
	$(ENV) $(SHELL_ENV) bash


.PHONY: bash/%
bash/%:
	$(ENV) $(SHELL_ENV) bash -c "$*"


.PHONY: shell
shell: ## Start a shell with make's environment.
	$(ECHO_INFO) "Starting a shell with make's environment..."
	$(ENV) $(SHELL_ENV) $(SHELL_BAK)


.PHONY: shell/%
shell/%:
	$(ENV) $(SHELL_ENV) $(SHELL_BAK) -c "$*"
