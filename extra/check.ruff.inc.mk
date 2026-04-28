RUFF = $(call which,RUFF,ruff)
ifeq (RUFF_NOT_FOUND,$(RUFF))
RUFF = $(UVX) ruff
endif

RUFF_CONFIG = $(GIT_ROOT)/.ruff.toml

RUFF_FLAGS += \
	--config $(RUFF_CONFIG) \

RUFF_FILES += \
	$(RUFF_FILES_EXT) \
	$(RUFF_FILES_SHEBANG) \

RUFF_FILES_EXT = $(shell $(GIT_LS_NOSYM) . | $(GREP) -e "\.py$$")

RUFF_FILES_SHEBANG_PATH = .

RUFF_FILES_SHEBANG = \
	$(shell $(GIT_LS_NOSYM) $(RUFF_FILES_SHEBANG_PATH) | \
		while read -r FILE; do \
		[[ ! -L "$${FILE}" ]] || continue; \
		[[ -f "$${FILE}" ]] || continue; \
		[[ -x "$${FILE}" ]] || continue; \
		$(HEAD) -n1 "$${FILE}" | $(GREP) "^$(hash)!/" | $(GREP) -q -e "\b\(python\|python2\|python3\|uv\)\b" || continue; \
		$(ECHO) "$${FILE}"; \
	done)

RUFF_FILES_FILTER_OUT += \
	$(DEFAULT_FILES_FILTER_OUT) \

# ------------------------------------------------------------------------------

.PHONY: debug/ruff
debug/ruff:
	$(ECHO)
	$(ECHO_DO) "Debug Ruff..."
	$(ECHO) "RUFF=$(RUFF)"
	$(ECHO) "RUFF_FILES=$(RUFF_FILES)"
	$(ECHO) "RUFF_FILES_EXT=$(RUFF_FILES_EXT)"
	$(ECHO) "RUFF_FILES_FILTER_OUT=$(RUFF_FILES_FILTER_OUT)"
	$(ECHO) "RUFF_FILES_SHEBANG=$(RUFF_FILES_SHEBANG)"
	$(ECHO) "RUFF_FLAGS=$(RUFF_FLAGS)"
	set -x && $(RUFF) --version || true
	$(ECHO_DONE)


.PHONY: check/ruff
check/ruff:
	RUFF_FILES_TMP=($(filter-out $(RUFF_FILES_FILTER_OUT), $(RUFF_FILES))); \
	[[ "$${#RUFF_FILES_TMP[@]}" = "0" ]] || { \
		$(RUFF) check --diff $(RUFF_FLAGS) $${RUFF_FILES_TMP[@]} || { \
			[[ -z "$${GITHUB_ACTIONS:-}" ]] || \
				$(RUFF) check --output-format github $(RUFF_FLAGS) $${RUFF_FILES_TMP[@]} || true; \
			$(RUFF) check --fix-only $(RUFF_FLAGS) $${RUFF_FILES_TMP[@]} 2>/dev/null; \
			exit 1; \
		}; \
	}
