SANE_BUILD ?=
SANE_CHECK ?=
SANE_CI ?=
SANE_CLEAN ?=
SANE_DEBUG ?=
SANE_DEPS ?=
SANE_DEPS_FILES ?=
SANE_DEPS_GITIGNORE ?=
SANE_DEPS_UPGRADE ?=
SANE_SYSTEM ?=
SANE_TEST ?=

SANE_ALL_DEFAULT := deps check build
SANE_ALL ?= $(SANE_ALL_DEFAULT)

SANE_CI_DEFAULT := all
SANE_CI ?= $(SANE_CI_DEFAULT)

SANE_DEPS_DEFAULT := deps/files
ifeq ($(MAKE_PATH),$(GIT_ROOT))
SANE_DEPS_DEFAULT += deps/gitignore
endif

# NOTE use *.generated.* to mark generated files
GENERATED_FILES_FILTER_OUT := \
	$(wildcard *.generated.*) \
	$(wildcard */*.generated.*) \
	$(wildcard */*/*.generated.*) \
	$(wildcard */*/*/*.generated.*) \
	$(wildcard */*/*/*/*.generated.*) \
	$(wildcard */*/*/*/*/*.generated.*) \
	$(wildcard */*/*/*/*/*/*.generated.*) \
	$(wildcard */*/*/*/*/*/*/*.generated.*) \
	$(wildcard */*/*/*/*/*/*/*/*.generated.*) \
	$(wildcard */*/*/*/*/*/*/*/*/*.generated.*) \
	$(wildcard */*/*/*/*/*/*/*/*/*/*.generated.*) \

# NOTE variable for filtering out files from checks
DEFAULT_FILES_FILTER_OUT := \
	$(GENERATED_FILES_FILTER_OUT) \

# ------------------------------------------------------------------------------

.PHONY: prehook/% posthook/%
prehook/%:
	:

posthook/%:
	:

# ------------------------------------------------------------------------------

.PHONY: all
all: prehook/all
all: $(SANE_ALL)
all:
	$(MAKE) posthook/$@


.PHONY: deps
deps: prehook/deps
deps: $(SANE_DEPS)
deps: ## Install local dependencies.
	$(MAKE) posthook/$@


.PHONY: deps/files
deps/files: prehook/deps/files
deps/files: $(SANE_DEPS_FILES)
deps/files: ## Install file dependencies.
	$(MAKE) posthook/$@


.PHONY: deps/gitignore
deps/gitignore: prehook/deps/gitignore
deps/gitignore: $(SANE_DEPS_GITIGNORE)
deps/gitignore: ## Install gitignore dependencies.
	$(MAKE) posthook/$@


.PHONY: deps/upgrade
deps/upgrade: prehook/deps/upgrade
deps/upgrade: $(SANE_DEPS_UPGRADE)
deps/upgrade: ## Upgrade local dependencies.
	$(MAKE) posthook/$@


.PHONY: check
check: prehook/check
check: $(SANE_CHECK)
check: ## Check.
	$(MAKE) posthook/$@


.PHONY: build
build: prehook/build
build: $(SANE_BUILD)
build: ## Build.
	$(MAKE) posthook/$@


.PHONY: test
test: prehook/test
test: $(SANE_TEST)
test: ## Test.
	$(MAKE) posthook/$@

# ------------------------------------------------------------------------------

.PHONY: ci
ci: prehook/ci
ci: $(SANE_CI)
ci: ## CI.
	$(MAKE) posthook/$@


.PHONY: clean
clean: prehook/clean
clean: $(SANE_CLEAN)
clean: ## Clean.
	$(MAKE) posthook/$@


.PHONY: debug
debug: prehook/debug
debug: $(SANE_DEBUG)
debug: ## Debug environment and software versions.
	$(MAKE) posthook/$@


.PHONY: system
system: prehook/system
system: $(SANE_SYSTEM)
system: ## Install system dependencies.
	$(MAKE) posthook/$@
