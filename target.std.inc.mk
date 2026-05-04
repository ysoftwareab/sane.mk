SANE_BUILD ?=
SANE_CHECK ?=
SANE_CI ?=
SANE_CLEAN ?=
SANE_DEBUG ?=
SANE_DEPS ?=
SANE_DEPS_FILES ?=
SANE_DEPS_FOLDERS ?=
SANE_DEPS_GITIGNORE ?=
SANE_DEPS_SYSTEM ?=
SANE_DEPS_UPGRADE ?=
SANE_TEST ?=

SANE_ALL_DEFAULT := deps check build
SANE_ALL ?= $(SANE_ALL_DEFAULT)

SANE_CI_DEFAULT := all
SANE_CI ?= $(SANE_CI_DEFAULT)

SANE_DEPS_DEFAULT := deps/folders deps/files
ifeq ($(MAKE_PATH),$(GIT_ROOT))
SANE_DEPS_DEFAULT += deps/gitignore
endif

# NOTE use *.generated.* to mark generated files
GENERATED_FILES_FILTER_OUT = \
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
DEFAULT_FILES_FILTER_OUT += \
	LICENSE $(GIT_ROOT_REL)/LICENSE \
	NOTICE $(GIT_ROOT_REL)/NOTICE \
	UNLICENSE $(GIT_ROOT_REL)/UNLICENSE \
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
all:
	$(MAKE) $(SANE_ALL)
	$(MAKE) posthook/$@


.PHONY: deps
deps: prehook/deps
deps: ## Install local dependencies.
	$(MAKE) $(SANE_DEPS)
	$(MAKE) posthook/$@


.PHONY: deps/files
deps/files: prehook/deps/files
deps/files:
	$(MAKE) $(SANE_DEPS_FILES)
	$(MAKE) posthook/$@


.PHONY: deps/folders
deps/folders: prehook/deps/folders
deps/folders:
	$(MAKE) $(SANE_DEPS_FOLDERS)
	$(MAKE) posthook/$@


.PHONY: deps/gitignore
deps/gitignore: prehook/deps/gitignore
deps/gitignore:
	$(MAKE) $(SANE_DEPS_GITIGNORE)
	$(MAKE) posthook/$@


.PHONY: deps/system
deps/system: prehook/deps/system
deps/system: ## Install system dependencies.
	$(MAKE) $(SANE_DEPS_SYSTEM)
	$(MAKE) posthook/$@


.PHONY: deps/upgrade
deps/upgrade: prehook/deps/upgrade
deps/upgrade: ## Upgrade local dependencies.
	$(MAKE) $(SANE_DEPS_UPGRADE)
	$(MAKE) posthook/$@


.PHONY: check
check: prehook/check
check: ## Check.
	$(MAKE) $(SANE_CHECK)
	$(MAKE) posthook/$@


.PHONY: build
build: prehook/build
build: ## Build.
	$(MAKE) $(SANE_BUILD)
	$(MAKE) posthook/$@


.PHONY: test
test: prehook/test
test: ## Test.
	$(MAKE) $(SANE_TEST)
	$(MAKE) posthook/$@

# ------------------------------------------------------------------------------

.PHONY: ci
ci: prehook/ci
ci: ## CI.
	$(MAKE) $(SANE_CI)
	$(MAKE) posthook/$@


.PHONY: clean
clean: prehook/clean
clean: ## Clean.
	$(MAKE) $(SANE_CLEAN)
	$(MAKE) posthook/$@


.PHONY: debug
debug: prehook/debug
debug: ## Debug environment and software versions.
	$(MAKE) $(SANE_DEBUG)
	$(MAKE) posthook/$@
