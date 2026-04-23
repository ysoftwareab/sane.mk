# ------------------------------------------------------------------------------

.PHONY: brew/list
brew/list: ## List Homebrew packages installed on request.
	$(BREW) list --install-on-request


.PHONY: brew/list/all
brew/list/all: ## List all Homebrew packages, including dependencies.
	$(BREW) list


.PHONY: brew/list/pinned
brew/list/pinned: ## List pinned Homebrew packages.
	$(BREW) list --pinned


.PHONY: brew/upgrade
brew/upgrade: ## Upgrade all Homebrew packages.
	$(BREW) update
	$(BREW) upgrade
	$(BREW) cleanup --prune=all
