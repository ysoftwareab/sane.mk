export NPM_CONFIG_UPDATE_NOTIFIER = false
COREPACK ?= $(call which,COREPACK,corepack)
ifeq (COREPACK_NOT_FOUND,$(COREPACK))
COREPACK = $(NPX) --yes corepack
else
$(call make-lazy,COREPACK)
endif

DEFAULT_FILES_FILTER_OUT += \
	$(shell $(GIT_LS) | $(GREP) -e "package-lock\.json$$" | $(NOSYM)) \
	$(shell $(GIT_LS) | $(GREP) -e "pnpm-lock\.yaml$$" | $(NOSYM)) \

# ------------------------------------------------------------------------------

.PHONY: debug/corepack
debug/corepack:
	$(ECHO)
	$(ECHO_DO) "Debug Corepack..."
	$(ECHO) "COREPACK=$(COREPACK)"
	set -x && $(COREPACK) --version || true
	set -x && which -a node && node --version || true
	$(ECHO_DONE)


.PHONY: deps/gitignore/corepack
deps/gitignore/corepack:
	:


.PHONY: deps/corepack/npm
deps/corepack/npm:
ifneq (,$(PKG_PACKAGE_MANAGER))
	$(ECHO) "$$($(JQ) '. += {"packageManager": "npm@11"}' package.json)" > package.json
	$(COREPACK) use pnpm@latest-11
endif
	$(COREPACK) npm ci


.PHONY: deps/corepack/npm-init
deps/corepack/npm-init:
ifneq (,$(PKG_PACKAGE_MANAGER))
	$(ECHO) "$$($(JQ) '. += {"packageManager": "npm@11"}' package.json)" > package.json
	$(COREPACK) use pnpm@latest-11
endif
	$(COREPACK) npm install


.PHONY: deps/corepack/pnpm
deps/corepack/pnpm:
ifneq (,$(PKG_PACKAGE_MANAGER))
	$(ECHO) "$$($(JQ) '. += {"packageManager": "pnpm@11"}' package.json)" > package.json
	$(COREPACK) use pnpm@latest-11
endif
	$(COREPACK) pnpm i --frozen-lockfile


.PHONY: deps/corepack/pnpm-init
deps/corepack/pnpm-init:
ifneq (,$(PKG_PACKAGE_MANAGER))
	$(ECHO) "$$($(JQ) '. += {"packageManager": "pnpm@11"}' package.json)" > package.json
	$(COREPACK) use pnpm@latest-11
endif
	$(COREPACK) pnpm i


.PHONY: deps/corepack
deps/corepack:
ifneq (,$(wildcard package.json))
	if [[ -e package-lock.json ]]; then \
		$(MAKE_DASH_F) deps/corepack/npm; \
	elif [[ "$(PKG_PACKAGE_MANAGER)" = npm* ]]; then \
		$(MAKE_DASH_F) deps/corepack/npm-init; \
	elif [[ -e pnpm-lock.yaml ]]; then \
		$(MAKE_DASH_F) deps/corepack/pnpm; \
	else \
		$(MAKE_DASH_F) deps/corepack/pnpm-init; \
	fi
else
	:
endif


.PHONY: deps/upgrade/corepack
deps/upgrade/corepack:
ifneq (,$(wildcard package.json))
	$(COREPACK) up
	if [[ -e package-lock.json ]]; then \
		$(COREPACK) npm update; \
	else \
		$(COREPACK) pnpm upgrade; \
	fi
else
	:
endif
