# Use Homebrew to install dependencies on macOS/Linux.
# For extensibility, the Brewfile is processed with
# envsubst-like variable substitution and support for # source directives.

export HOMEBREW_DISPLAY_INSTALL_TIMES ?= 1
export HOMEBREW_FAIL_LOG_LINES ?= 100
export HOMEBREW_NO_INSTALL_CLEANUP ?= 1
export HOMEBREW_VERBOSE_USING_DOTS ?= 1

BREWFILE = Brewfile
BREWFILE_SH = Brewfile.sh
BREWFILE_TEST = Brewfile.test

BREW_BUNDLE_FLAGS += \

ifeq (true,$(VERBOSE))
BREW_BUNDLE_FLAGS += --verbose
endif

BREWFILE_ENV = \
	ARCH=$(ARCH) \
	ARCH_BIT=$(ARCH_BIT) \
	ARCH_NORMALIZED=$(ARCH_NORMALIZED) \
	ARCH_SHORT=$(ARCH_SHORT) \
	HOST=$(HOST) \
	HOST_SHORT=$(HOST_SHORT) \
	OS=$(OS) \
	OS_SHORT=$(OS_SHORT) \

CAT_BREWFILE = \
	$(CAT) $(BREWFILE) \
		| $(SED) "s/\$${\?ARCH}\?/$(ARCH)/g" \
		| $(SED) "s/\$${\?ARCH_BIT}\?/$(ARCH_BIT)/g" \
		| $(SED) "s/\$${\?ARCH_NORMALIZED}\?/$(ARCH_NORMALIZED)/g" \
		| $(SED) "s/\$${\?ARCH_SHORT}\?/$(ARCH_SHORT)/g" \
		| $(SED) "s/\$${\?HOST}\?/$(HOST)/g" \
		| $(SED) "s/\$${\?HOST_SHORT}\?/$(HOST_SHORT)/g" \
		| $(SED) "s/\$${\?OS}\?/$(OS)/g" \
		| $(SED) "s/\$${\?OS_SHORT}\?/$(OS_SHORT)/g" \
		| $(SED) "s/^$(hash) source \\(.\\+\\)$$/cat \1/e" \
		| $(SED) "s/^$(hash) source \\(.\\+\\)$$/cat \1/e" \
		| $(SED) "s/^$(hash) source \\(.\\+\\)$$/cat \1/e"

# ------------------------------------------------------------------------------

.PHONY: system/brewfile
system/brewfile:
ifneq (,$(wildcard $(BREWFILE)))
	unset GITHUB_ACTIONS; \
	$(CAT_BREWFILE) | brew bundle install $(BREW_BUNDLE_FLAGS) --file=-
ifneq (,$(wildcard $(BREWFILE_SH)))
	$(BREWFILE_ENV) ./$(BREWFILE_SH)
endif
else
	:
endif


.PHONY: test/system/brewfile
test/system/brewfile:
ifneq (,$(wildcard $(BREWFILE)))
	unset GITHUB_ACTIONS; \
	$(CAT_BREWFILE) | brew bundle check $(BREW_BUNDLE_FLAGS) --file=-
ifneq (,$(wildcard $(BREWFILE_TEST)))
	$(BREWFILE_ENV) ./$(BREWFILE_TEST)
endif
else
	:
endif
