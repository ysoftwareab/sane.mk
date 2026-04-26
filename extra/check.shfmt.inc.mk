SHFMT ?= $(call which,SHFMT,shfmt)

SHFMT_FLAGS += \
	--indent 4 \
	--binary-next-line \
	--case-indent \

SHFMT_FILES += \
	$(SHFMT_FILES_EXT) \
	$(SHFMT_FILES_SHEBANG) \

SHFMT_FILES_EXT = \
	$(shell $(GIT_LS_NOSYM) | $(GREP) -e "\.sh$$") \

SHFMT_FILES_SHEBANG = $(SHELLCHECK_FILES_SHEBANG)

SHFMT_FILES_FILTER_OUT += \
	$(DEFAULT_FILES_FILTER_OUT) \

# ------------------------------------------------------------------------------

.PHONY: debug/shfmt
debug/shfmt:
	$(ECHO)
	$(ECHO_DO) "Debug SHFMT..."
	$(ECHO) "SHFMT=$(SHFMT)"
	$(ECHO) "SHFMT_FILES=$(SHFMT_FILES)"
	$(ECHO) "SHFMT_FILES_EXT=$(SHFMT_FILES_EXT)"
	$(ECHO) "SHFMT_FILES_FILTER_OUT=$(SHFMT_FILES_FILTER_OUT)"
	$(ECHO) "SHFMT_FILES_SHEBANG=$(SHFMT_FILES_SHEBANG)"
	$(ECHO) "SHFMT_FLAGS=$(SHFMT_FLAGS)"
	set -x && $(SHFMT) --version || true
	$(ECHO_DONE)


.PHONY: check/shfmt
check/shfmt:
	SHFMT_FILES_TMP=($(filter-out $(SHFMT_FILES_FILTER_OUT), $(SHFMT_FILES))); \
	[[ "$${#SHFMT_FILES_TMP[@]}" = "0" ]] || { \
		$(SHFMT) --diff $(SHFMT_FLAGS) $${SHFMT_FILES_TMP[@]} || { \
			$(SHFMT) --write $(SHFMT_FLAGS) $${SHFMT_FILES_TMP[@]}; \
			exit 1; \
		}; \
	}
