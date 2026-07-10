SHELLCHECK ?= $(call which,SHELLCHECK,shellcheck)
$(call make-lazy,SHELLCHECK)

SHELLCHECK_FLAGS += \

SHELLCHECK_FILES += \
	$(SHELLCHECK_FILES_EXT) \
	$(SHELLCHECK_FILES_SHEBANG) \

SHELLCHECK_FILES_EXT = $(shell $(GIT_LS) | $(GREP) -e "\.sh$$" | $(NOSYM))

SHELLCHECK_FILES_SHEBANG_PATH = .

SHELLCHECK_FILES_SHEBANG = \
	$(shell $(GIT_LS) $(SHELLCHECK_FILES_SHEBANG_PATH) | \
		while read -r FILE; do \
		[[ ! -L "$${FILE}" ]] || continue; \
		[[ -f "$${FILE}" ]] || continue; \
		[[ -x "$${FILE}" ]] || continue; \
		$(HEAD) -n1 "$${FILE}" | $(GREP) "^$(hash)!/" | $(GREP) -q -e "\b\(bash\|sh\)\b" || continue; \
		$(ECHO) "$${FILE}"; \
	done)

SHELLCHECK_FILES_FILTER_OUT += \
	$(DEFAULT_FILES_FILTER_OUT) \

# ------------------------------------------------------------------------------

.PHONY: debug/shellcheck
debug/shellcheck:
	$(ECHO)
	$(ECHO_DO) "Debug ShellCheck..."
	$(ECHO) "SHELLCHECK=$(SHELLCHECK)"
	$(ECHO) "SHELLCHECK_FILES=$(SHELLCHECK_FILES)"
	$(ECHO) "SHELLCHECK_FILES_EXT=$(SHELLCHECK_FILES_EXT)"
	$(ECHO) "SHELLCHECK_FILES_FILTER_OUT=$(SHELLCHECK_FILES_FILTER_OUT)"
	$(ECHO) "SHELLCHECK_FILES_SHEBANG=$(SHELLCHECK_FILES_SHEBANG)"
	$(ECHO) "SHELLCHECK_FLAGS=$(SHELLCHECK_FLAGS)"
	set -x && $(SHELLCHECK) --version || true
	$(ECHO_DONE)


.PHONY: check/shellcheck
check/shellcheck:
	SHELLCHECK_FILES_TMP=($(filter-out $(SHELLCHECK_FILES_FILTER_OUT), $(SHELLCHECK_FILES))); \
	[[ "$${#SHELLCHECK_FILES_TMP[@]}" = "0" ]] || { \
		[[ "$(MAKE_PATH)" != "$(GIT_ROOT)" ]] || { \
			[[ -e .shellcheckrc ]] \
				|| [[ -e shellcheckrc ]] \
				|| $(MAKE_DASH_F) .shellcheckrc; \
		}; \
		$(SHELLCHECK) $(SHELLCHECK_FLAGS) $${SHELLCHECK_FILES_TMP[@]}; \
	}


.PHONY: check/shellcheck/%
check/shellcheck/%:
	[[ "$(MAKE_PATH)" != "$(GIT_ROOT)" ]] || { \
		[[ -e .shellcheckrc ]] \
			|| [[ -e shellcheckrc ]] \
			|| $(MAKE_DASH_F) .shellcheckrc; \
	}; \
	$(SHELLCHECK) $(SHELLCHECK_FLAGS) $*
