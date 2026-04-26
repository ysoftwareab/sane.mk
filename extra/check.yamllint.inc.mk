YAMLLINT ?= $(call which,YAMLLINT,yamllint)

YAMLLINT_FLAGS += \
	--format parsable \

YAMLLINT_FILES += \
	$(YAMLLINT_FILES_EXT) \
	$(YAMLLINT_FILES_SHEBANG) \

YAMLLINT_FILES_EXT = $(shell $(GIT_LS_NOSYM) . | $(GREP) -e "\.\(yaml\|yml\)$$")

YAMLLINT_FILES_SHEBANG_PATH = .

YAMLLINT_FILES_SHEBANG = \
	$(shell $(GIT_LS_NOSYM) $(YAMLLINT_FILES_SHEBANG_PATH) | \
		while read -r FILE; do \
		[[ ! -L "$${FILE}" ]] || continue; \
		[[ -f "$${FILE}" ]] || continue; \
		$(HEAD) -n1 "$${FILE}" | $(GREP) -q -e "^$(hash) -\\*- mode: yaml -\\*-$$" || continue; \
		$(ECHO) "$${FILE}"; \
	done)

YAMLLINT_FILES_FILTER_OUT += \
	$(DEFAULT_FILES_FILTER_OUT) \

# ------------------------------------------------------------------------------

.PHONY: debug/yamllint
debug/yamllint:
	$(ECHO)
	$(ECHO_DO) "Debug Yamllint..."
	$(ECHO) "YAMLLINT=$(YAMLLINT)"
	$(ECHO) "YAMLLINT_FILES=$(YAMLLINT_FILES)"
	$(ECHO) "YAMLLINT_FILES_EXT=$(YAMLLINT_FILES_EXT)"
	$(ECHO) "YAMLLINT_FILES_FILTER_OUT=$(YAMLLINT_FILES_FILTER_OUT)"
	$(ECHO) "YAMLLINT_FILES_SHEBANG=$(YAMLLINT_FILES_SHEBANG)"
	$(ECHO) "YAMLLINT_FLAGS=$(YAMLLINT_FLAGS)"
	set -x && $(YAMLLINT) --version || true
	$(ECHO_DONE)


#	NOTE FileNotFoundError: [Errno 2] No such file or directory: '.gitignore'
.PHONY: check/yamllint
check/yamllint:
	YAMLLINT_FILES_TMP=($(filter-out $(YAMLLINT_FILES_FILTER_OUT), $(YAMLLINT_FILES))); \
	[[ "$${#YAMLLINT_FILES_TMP[@]}" = "0" ]] || { \
		[[ "$(MAKE_PATH)" != "$(GIT_ROOT)" ]] || $(MAKE) .yamllint; \
		[[ -e .gitignore ]] || $(TOUCH) .gitignore; \
		$(YAMLLINT) $(YAMLLINT_FLAGS) $${YAMLLINT_FILES_TMP[@]}; \
	}
