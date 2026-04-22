SANE_DEBUG_ENV = \
	debug/env \
	debug/env/docker \
	debug/env/git \
	debug/env/homebrew \
	debug/env/node \
	debug/env/python \

# ------------------------------------------------------------------------------

.PHONY: debug/env
debug/env:
	$(ECHO)
	$(ECHO_DO) "Debug env..."
	$(ECHO) "BASH=$(BASH)"
	$(ECHO) "CI=$(CI)"
	$(ECHO) "DOCKER=$(DOCKER)"
	$(ECHO) "HOST=$(HOST)"
	$(ECHO) "LANG=$(LANG)"
	$(ECHO) "LC_ALL=$(LC_ALL)"
	$(ECHO) "MAKE=$(MAKE)"
	$(ECHO) "SHELL=$(SHELL)"
	$(ECHO) "TZ=$(TZ)"
	$(ECHO) "USER=$(USER)"
	$(ECHO) "V=$(V)"
	$(ECHO) "VERBOSE=$(VERBOSE)"
	$(ECHO_DONE)
	$(ECHO)
	$(ECHO_DO) "Debug env (paths)..."
	$(ECHO) "GIT_ROOT=$(GIT_ROOT)"
	$(ECHO) "HOME=$(HOME)"
	$(ECHO) "MAKE_PATH=$(MAKE_PATH)"
	$(ECHO) "PATH=$(PATH)"
	$(ECHO) "PWD=$(PWD)"
	$(ECHO) "SANE_MK_ROOT=$(SANE_MK_ROOT)"
	$(ECHO_DONE)


.PHONY: debug/env/docker
debug/env/docker:
	$(ECHO)
	$(ECHO_DO) "Debug env (Docker)..."
	$(ECHO) "DOCKER=$(DOCKER)"
	set -x && $(DOCKER) --version || true
	set -x && $(DOCKER) version || true
	set -x && $(DOCKER) info || true
	set -x && $(DOCKER) buildx version || true
	set -x && $(DOCKER) buildx ls || true
	set -x && $(DOCKER) buildx inspect --bootstrap || true
	set -x && $(DOCKER) compose version || true
	$(ECHO_DONE)


.PHONY: debug/env/git
debug/env/git:
	$(ECHO)
	$(ECHO_DO) "Debug env (Git)..."
	$(ECHO) "GIT=$(GIT)"
	$(ECHO) "GIT_BRANCH=$(GIT_BRANCH)"
	$(ECHO) "GIT_DESCRIBE=$(GIT_DESCRIBE)"
	$(ECHO) "GIT_HASH=$(GIT_HASH)"
	$(ECHO) "GIT_REMOTE_OR_ORIGIN_URL=$(GIT_REMOTE_OR_ORIGIN_URL)"
	$(ECHO) "GH=$(GH)"
	set -x && $(GIT) --version || true
	$(ECHO_DONE)


.PHONY: debug/env/homebrew
debug/env/homebrew:
	$(ECHO)
	$(ECHO_DO) "Debug env (Homebrew)..."
	$(ECHO) "BREW=$(BREW)"
	$(ECHO) "HOMEBREW_PREFIX=$(HOMEBREW_PREFIX)"
	set -x && $(BREW) --version || true
	set -x && $(BREW) doctor || true
	$(ECHO_DONE)


.PHONY: debug/env/node
debug/env/node:
	$(ECHO)
	$(ECHO_DO) "Debug env (NodeJS)..."
	$(ECHO) "N=$(N)"
	$(ECHO) "NODE=$(NODE)"
	set -x && $(N) --version || true
	set -x && $(NODE) --version || true
	$(ECHO)


.PHONY: debug/env/python
debug/env/python:
	$(ECHO)
	$(ECHO_DO) "Debug env (Python)..."
	$(ECHO) "PYTHON=$(PYTHON)"
	$(ECHO) "PYTHON3=$(PYTHON3)"
	set -x && $(PYTHON) --version || true
	set -x && $(PYTHON3) --version || true
	$(ECHO_DONE)
