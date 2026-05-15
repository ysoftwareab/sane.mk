SANE_BUILD ?= noop
SANE_CHECK ?= noop
SANE_CI ?= noop
SANE_CLEAN ?= noop
SANE_DEBUG ?= noop
SANE_DEPS ?= noop
SANE_DEPS_FILES ?= noop
SANE_DEPS_FOLDERS ?= noop
SANE_DEPS_GITIGNORE ?= noop
SANE_DEPS_UPGRADE ?= noop
SANE_SYSTEM ?= noop
SANE_TEST ?= noop

SANE_ALL_DEFAULT := deps check build
SANE_ALL ?= $(SANE_ALL_DEFAULT)

SANE_CI_DEFAULT := all test
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

.PHONY: system
system: prehook/system
deps/system: ## Install system dependencies.
	$(MAKE_DASH_F) $(SANE_SYSTEM)
	$(MAKE_DASH_F) posthook/$@


.PHONY: all
all: prehook/all
all:
	$(MAKE_DASH_F) $(SANE_ALL)
	$(MAKE_DASH_F) posthook/$@


.PHONY: deps
deps: prehook/deps
deps: ## Install local dependencies.
	$(MAKE_DASH_F) $(SANE_DEPS)
	$(MAKE_DASH_F) posthook/$@


.PHONY: deps/files
deps/files: prehook/deps/files
deps/files:
	$(MAKE_DASH_F) $(SANE_DEPS_FILES)
	$(MAKE_DASH_F) posthook/$@


.PHONY: deps/folders
deps/folders: prehook/deps/folders
deps/folders:
	$(MAKE_DASH_F) $(SANE_DEPS_FOLDERS)
	$(MAKE_DASH_F) posthook/$@


.PHONY: deps/gitignore
deps/gitignore: prehook/deps/gitignore
deps/gitignore:
	$(MAKE_DASH_F) $(SANE_DEPS_GITIGNORE)
	$(MAKE_DASH_F) posthook/$@


.PHONY: deps/upgrade
deps/upgrade: prehook/deps/upgrade
deps/upgrade: ## Upgrade local dependencies.
	$(MAKE_DASH_F) $(SANE_DEPS_UPGRADE)
	$(MAKE_DASH_F) posthook/$@


.PHONY: check
check: prehook/check
check: ## Check.
	$(MAKE_DASH_F) $(SANE_CHECK)
	$(MAKE_DASH_F) posthook/$@


.PHONY: build
build: prehook/build
build: ## Build.
	$(MAKE_DASH_F) $(SANE_BUILD)
	$(MAKE_DASH_F) posthook/$@


.PHONY: test
test: prehook/test
test: ## Test.
	$(MAKE_DASH_F) $(SANE_TEST)
	$(MAKE_DASH_F) posthook/$@

# ------------------------------------------------------------------------------

.PHONY: ci
ci: prehook/ci
ci: ## CI.
	$(MAKE_DASH_F) $(SANE_CI)
	$(MAKE_DASH_F) posthook/$@


.PHONY: clean
clean: prehook/clean
clean: ## Clean.
	$(MAKE_DASH_F) $(SANE_CLEAN)
	$(MAKE_DASH_F) posthook/$@


.PHONY: debug
debug: prehook/debug
debug: ## Debug environment and software versions.
	$(MAKE_DASH_F) $(SANE_DEBUG)
	$(MAKE_DASH_F) posthook/$@
