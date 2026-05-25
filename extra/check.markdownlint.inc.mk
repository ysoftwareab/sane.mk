MARKDOWNLINT ?= $(call which,MARKDOWNLINT,markdownlint)
$(call make-lazy,MARKDOWNLINT)

MARKDOWNLINT_FLAGS_IGNORE = \
	--ignore node_modules \

MARKDOWNLINT_FLAGS += \

MARKDOWNLINT_FILES += \
	$(MARKDOWNLINT_FILES_EXT) \
	$(MARKDOWNLINT_FILES_SHEBANG) \

MARKDOWNLINT_FILES_EXT = $(shell $(GIT_LS) | $(GREP) -e "\.md$$" | $(NOSYM))

MARKDOWNLINT_FILES_SHEBANG_PATH = .

MARKDOWNLINT_FILES_SHEBANG = \
	$(shell $(GIT_LS) $(MARKDOWNLINT_FILES_SHEBANG_PATH) | \
		while read -r FILE; do \
		[[ ! -L "$${FILE}" ]] || continue; \
		[[ -f "$${FILE}" ]] || continue; \
		$(HEAD) -n1 "$${FILE}" | $(GREP) -q -e "^<!-- -\\*- mode: markdown -\\*- -->$$" || continue; \
		$(ECHO) "$${FILE}"; \
	done)

MARKDOWNLINT_FILES_FILTER_OUT += \
	$(DEFAULT_FILES_FILTER_OUT) \

# ------------------------------------------------------------------------------

.PHONY: debug/markdownlint
debug/markdownlint:
	$(ECHO)
	$(ECHO_DO) "Debug Markdownlint..."
	$(ECHO) "MARKDOWNLINT=$(MARKDOWNLINT)"
	$(ECHO) "MARKDOWNLINT_FILES=$(MARKDOWNLINT_FILES)"
	$(ECHO) "MARKDOWNLINT_FILES_EXT=$(MARKDOWNLINT_FILES_EXT)"
	$(ECHO) "MARKDOWNLINT_FILES_FILTER_OUT=$(MARKDOWNLINT_FILES_FILTER_OUT)"
	$(ECHO) "MARKDOWNLINT_FILES_SHEBANG=$(MARKDOWNLINT_FILES_SHEBANG)"
	$(ECHO) "MARKDOWNLINT_FLAGS=$(MARKDOWNLINT_FLAGS)"
	$(ECHO) "MARKDOWNLINT_FLAGS_IGNORE=$(MARKDOWNLINT_FLAGS_IGNORE)"
	set -x && $(MARKDOWNLINT) --version || true
	$(ECHO_DONE)


.PHONY: check/markdownlint
check/markdownlint:
	MARKDOWNLINT_FILES_TMP=($(filter-out $(MARKDOWNLINT_FILES_FILTER_OUT), $(MARKDOWNLINT_FILES))); \
	[[ "$${#MARKDOWNLINT_FILES_TMP[@]}" = "0" ]] || { \
		[[ "$(MAKE_PATH)" != "$(GIT_ROOT)" ]] || { \
			[[ -e .markdownlint.json ]] \
				|| [[ -e .markdownlint.jsonc ]] \
				|| [[ -e .markdownlint.yaml ]] \
				|| [[ -e .markdownlint.yml ]] \
				|| [[ -e .markdownlintrc ]] \
				|| $(MAKE_DASH_F) .markdownlintrc; \
		}; \
		$(MARKDOWNLINT) $(MARKDOWNLINT_FLAGS_IGNORE) $(MARKDOWNLINT_FLAGS) $${MARKDOWNLINT_FILES_TMP[@]} || { \
			$(MARKDOWNLINT) $(MARKDOWNLINT_FLAGS_IGNORE) $(MARKDOWNLINT_FLAGS) --fix $${MARKDOWNLINT_FILES_TMP[@]}; \
			exit 1; \
		}; \
	}
