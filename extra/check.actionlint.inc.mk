ACTIONLINT ?= $(call which,ACTIONLINT,actionlint)
$(call make-lazy,ACTIONLINT)

# https://github.com/rhysd/actionlint/blob/main/docs/usage.md#ignore-some-errors
# Allow constant expressions
ACTIONLINT_FLAGS += \
	-ignore 'constant expression ".*" in condition\. remove the if: section' \

ACTIONLINT_FILES += \
	$(ACTIONLINT_FILES_EXT) \

ACTIONLINT_FILES_EXT = $(shell $(GIT_LS_NOSYM) | $(GREP) -e "^\.github/workflows/.*\.yml$$")

ACTIONLINT_FILES_FILTER_OUT += \
	$(DEFAULT_FILES_FILTER_OUT) \

# ------------------------------------------------------------------------------

.PHONY: debug/actionlint
debug/actionlint:
	$(ECHO)
	$(ECHO_DO) "Debug Actionlint..."
	$(ECHO) "ACTIONLINT=$(ACTIONLINT)"
	$(ECHO) "ACTIONLINT_FILES=$(ACTIONLINT_FILES)"
	$(ECHO) "ACTIONLINT_FILES_EXT=$(ACTIONLINT_FILES_EXT)"
	$(ECHO) "ACTIONLINT_FILES_FILTER_OUT=$(ACTIONLINT_FILES_FILTER_OUT)"
	$(ECHO) "ACTIONLINT_FLAGS=$(ACTIONLINT_FLAGS)"
	set -x && $(ACTIONLINT) --version || true
	$(ECHO_DONE)


.PHONY: check/actionlint
check/actionlint:
	ACTIONLINT_FILES_TMP=($(filter-out $(ACTIONLINT_FILES_FILTER_OUT), $(ACTIONLINT_FILES))); \
	[[ "$${#ACTIONLINT_FILES_TMP[@]}" = "0" ]] || { \
		[[ "$(MAKE_PATH)" != "$(GIT_ROOT)" ]] || { \
			[[ -e .github/actionlint.yaml ]] || $(MAKE) .github/actionlint.yaml; \
			[[ -e .shellcheckrc ]] || $(MAKE) .shellcheckrc; \
		}; \
		$(ACTIONLINT) $(ACTIONLINT_FLAGS) $${ACTIONLINT_FILES_TMP[@]}; \
	}
