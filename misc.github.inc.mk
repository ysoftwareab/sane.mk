GITHUB_ACTIONS ?=
GITHUB_EVENT_NAME ?=
GITHUB_SERVER_URL ?= https://github.com
ifneq (,$(GITHUB_ACTIONS))
GITHUB_USERNAME = $( \
	shell $(GH) auth status 2>&1 | $(GREP) -o "Logged in to $(GH_HOST) \(as\|account\) [^ ]\+" | $(GREP) -o "[^ ]\+$$")
endif
export GH_HOST ?= $(shell basename "$(GITHUB_SERVER_URL)")
