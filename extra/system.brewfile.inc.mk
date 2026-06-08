# Use Homebrew to install dependencies on macOS/Linux.
# For extensibility, the Brewfile is processed with
# envsubst-like variable substitution and support for # source directives.

export HOMEBREW_DISPLAY_INSTALL_TIMES ?= 1
export HOMEBREW_FAIL_LOG_LINES ?= 100
export HOMEBREW_NO_ENV_HINTS ?= 1
export HOMEBREW_NO_INSTALL_CLEANUP ?= 1
export HOMEBREW_VERBOSE_USING_DOTS ?= 1

ifeq (,$(HOMEBREW_PREFIX))
HOMEBREW_PREFIX := $(shell brew --prefix 2>/dev/null)
ifeq (,$(HOMEBREW_PREFIX))
ifneq (,$(wildcard /opt/homebrew/bin/brew))
HOMEBREW_PREFIX := /opt/homebrew
else ifneq (,$(wildcard /usr/local/bin/brew))
HOMEBREW_PREFIX := /usr/local
else ifneq (,$(wildcard /home/linuxbrew/.linuxbrew/bin/brew))
HOMEBREW_PREFIX := /home/linuxbrew/.linuxbrew
endif
endif
export HOMEBREW_PREFIX
endif

# Helper: prepend a $(HOMEBREW_PREFIX)-relative directory to PATH if not already present
brew-path-prepend = $(if $(filter $(HOMEBREW_PREFIX)/$(1),$(subst :, ,$(PATH))),$(PATH),$(HOMEBREW_PREFIX)/$(1):$(PATH))

ifneq (,$(HOMEBREW_PREFIX))
PATH := $(call brew-path-prepend,bin)
PATH := $(call brew-path-prepend,sbin)
PATH := $(call brew-path-prepend,opt/coreutils/libexec/gnubin)
PATH := $(call brew-path-prepend,opt/findutils/libexec/gnubin)
PATH := $(call brew-path-prepend,opt/gawk/libexec/gnubin)
PATH := $(call brew-path-prepend,opt/gnu-sed/libexec/gnubin)
PATH := $(call brew-path-prepend,opt/gnu-tar/libexec/gnubin)
PATH := $(call brew-path-prepend,opt/gnu-time/libexec/gnubin)
PATH := $(call brew-path-prepend,opt/gnu-which/libexec/gnubin)
PATH := $(call brew-path-prepend,opt/gpatch/libexec/gnubin)
PATH := $(call brew-path-prepend,opt/grep/libexec/gnubin)
PATH := $(call brew-path-prepend,opt/gzip/libexec/gnubin)
PATH := $(call brew-path-prepend,opt/make/libexec/gnubin)
PATH := $(call brew-path-prepend,opt/curl/bin)
PATH := $(call brew-path-prepend,opt/gnu-getopt/bin)
PATH := $(call brew-path-prepend,opt/openssl@3/bin)
PATH := $(call brew-path-prepend,opt/tfenv/bin)
PATH := $(call brew-path-prepend,opt/unzip/bin)
PATH := $(call brew-path-prepend,opt/zip/bin)
endif
export PATH

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
	$(CAT_BREWFILE) | brew bundle check --verbose $(BREW_BUNDLE_FLAGS) --file=-
ifneq (,$(wildcard $(BREWFILE_TEST)))
	$(BREWFILE_ENV) ./$(BREWFILE_TEST)
endif
else
	:
endif
