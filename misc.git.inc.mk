# sync with  sh/git.inc.sh

GIT_DIR = $(shell $(GIT) rev-parse --path-format=absolute --git-dir 2>/dev/null)
GIT_DIR_REL = $(shell $(GIT) rev-parse --path-format=relative --git-dir 2>/dev/null)

GIT_COMMON_DIR = $(shell $(GIT) rev-parse --path-format=absolute --git-common-dir 2>/dev/null)
GIT_COMMON_DIR_REL = $(shell $(GIT) rev-parse --path-format=relative --git-common-dir 2>/dev/null)

GIT_BRANCH = $(shell $(GIT) rev-parse --abbrev-ref HEAD 2>/dev/null)
GIT_BRANCH_SHORT = $(notdir $(GIT_BRANCH))
GIT_BRANCH_DEFAULT = $(shell $(GIT) ls-remote --symref $(GIT_REMOTE_OR_ORIGIN) HEAD | $(HEAD) -n1 | $(CUT) -f1 | $(SED) "s|^ref: refs/heads/||")
ifdef SEMAPHORE_GIT_BRANCH
GIT_BRANCH = $(SEMAPHORE_GIT_BRANCH)
endif
ifdef TRAVIS_BRANCH
GIT_BRANCH = $(TRAVIS_BRANCH)
endif

GIT_DESCRIBE = $(shell $(GIT) describe --tags --first-parent --always --dirty 2>/dev/null)
GIT_DESCRIBE_MAJOR = $(word 1,$(subst ., ,$(GIT_DESCRIBE)))
GIT_DESCRIBE_MAJOR_MINOR = $(word 1,$(subst ., ,$(GIT_DESCRIBE))).$(word 2,$(subst ., ,$(GIT_DESCRIBE)))

GIT_COMMIT_MSG = $(shell $(GIT) log -1 --format="%B" 2>/dev/null)
GIT_HASH = $(shell $(GIT) rev-parse HEAD 2>/dev/null)
GIT_HASH_SHORT = $(shell $(GIT) rev-parse --short HEAD 2>/dev/null)
GIT_TAGS = $(shell $(GIT) tag --points-at HEAD 2>/dev/null)
GIT_TAG = $(shell $(GIT) tag --points-at HEAD | $(HEAD) -n1 2>/dev/null)

GIT_REMOTE = $(shell $(GIT) config branch.$(GIT_BRANCH).remote 2>/dev/null)
GIT_REMOTE_ORIGIN = origin
GIT_REMOTE_OR_ORIGIN = $(shell GIT_REMOTE=$(GIT_REMOTE); $(ECHO) $${GIT_REMOTE:-$(GIT_REMOTE_ORIGIN)})
GIT_ROOT = $(shell $(GIT) rev-parse --show-toplevel 2>/dev/null)
$(foreach VAR,GIT_REMOTE GIT_REMOTE_OR_ORIGIN GIT_ROOT,$(call make-lazy-once,$(VAR)))

# editorconfig-checker-disable max_line_length
# NOTE cannot use # editorconfig-checker-disable-line because it might add faux whitespace
GIT_REMOTE_URL = $(shell $(GIT) config remote.$(GIT_REMOTE).url 2>/dev/null)
GIT_REMOTE_SLUG = $(shell test -n $(GIT_REMOTE_URL); GIT_REMOTE_URL=$(GIT_REMOTE_URL); basename $$(dirname "$${GIT_REMOTE_URL//://}"))/$(shell basename "$(GIT_REMOTE_URL)" .git)

GIT_REMOTE_ORIGIN_URL ?= $(shell $(GIT) config remote.$(GIT_REMOTE_ORIGIN).url 2>/dev/null)
GIT_REMOTE_ORIGIN_URL_SLUG ?= $(shell test -n $(GIT_REMOTE_ORIGIN_URL); GIT_REMOTE_ORIGIN_URL=$(GIT_REMOTE_ORIGIN_URL); basename $$(dirname "$${GIT_REMOTE_ORIGIN_URL//://}"))/$(shell basename "$(GIT_REMOTE_ORIGIN_URL)" .git)

GIT_REMOTE_OR_ORIGIN_URL = $(shell $(GIT) config remote.$(GIT_REMOTE_OR_ORIGIN).url 2>/dev/null)
GIT_REMOTE_OR_ORIGIN_SLUG = $(shell test -n $(GIT_REMOTE_OR_ORIGIN_URL); GIT_REMOTE_OR_ORIGIN_URL=$(GIT_REMOTE_OR_ORIGIN_URL); basename $$(dirname "$${GIT_REMOTE_OR_ORIGIN_URL//://}"))/$(shell basename "$(GIT_REMOTE_OR_ORIGIN_URL)" .git)
# editorconfig-checker-enable max_line_length

GIT_REPO_HAS_CHANGED_FILES = $(shell $(GIT) status --porcelain | $(GREP) -q -v -e "^$$" && \
	$(ECHO) true || $(ECHO) false)
GIT_REPO_HAS_STAGED_FILES = $(shell $(GIT) status --porcelain | $(GREP) -q -e "^[^ U\?]" && \
	$(ECHO) true || $(ECHO) false)
GIT_REPO_HAS_UNSTAGED_FILES = $(shell $(GIT) status --porcelain | $(GREP) -q -e "^ [^ ]" && \
	$(ECHO) true || $(ECHO) false)
GIT_REPO_HAS_UNTRACKED_FILES = $(shell $(GIT) status --porcelain | $(GREP) -q -e "^?\?" && \
	$(ECHO) true || $(ECHO) false)
GIT_REPO_HAS_CONFLICTS = $(shell $(GIT) status --porcelain | $(GREP) -q -e "^\(DD\|AU\|UD\|UA\|DU\|AA\|UU\)" && \
	$(ECHO) true || $(ECHO) false)

GIT_CHECK_IGNORE = $(shell $(GIT) check-ignore $(MAKE_PATH) >/dev/null 2>&1 && $(ECHO) true || $(ECHO) false)
GIT_INSIDE_WORK_TREE = $(shell $(GIT) rev-parse --is-inside-work-tree >/dev/null 2>&1 && $(ECHO) true || $(ECHO) false)
GIT_TRACKED := false
ifeq (truefalse,$(GIT_INSIDE_WORK_TREE)$(GIT_CHECK_IGNORE))
GIT_TRACKED := true
endif

# ------------------------------------------------------------------------------

.PHONY: debug/git
debug/git:
	$(ECHO)
	$(ECHO_DO) "Debug git..."
	$(ECHO) "GIT=$(GIT)"
	$(ECHO) "GIT_BRANCH=$(GIT_BRANCH)"
	$(ECHO) "GIT_DESCRIBE=$(GIT_DESCRIBE)"
	$(ECHO) "GIT_HASH=$(GIT_HASH)"
	$(ECHO) "GIT_REMOTE_OR_ORIGIN_URL=$(GIT_REMOTE_OR_ORIGIN_URL)"
