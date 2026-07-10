RUFF ?= $(call which,RUFF,ruff)
ifeq (RUFF_NOT_FOUND,$(RUFF))
export RUFF_VSN ?= >=0.15.0,<0.16
RUFF = $(UVX) ruff$(RUFF_VSN)
else
$(call make-lazy-once,RUFF)
endif

RUFF_FLAGS += \

RUFF_FLAGS_WITH_OUTPUT_FORMAT = $(RUFF_FLAGS)
ifneq (,$(CI))
RUFF_FLAGS_WITH_OUTPUT_FORMAT += --output-format github
endif

RUFF_FILES += \
	$(RUFF_FILES_EXT) \
	$(RUFF_FILES_SHEBANG) \

RUFF_FILES_EXT = $(PYTHON_FILES_EXT)

RUFF_FILES_SHEBANG_PATH = .

RUFF_FILES_SHEBANG = $(PYTHON_FILES_SHEBANG)

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
				$(RUFF) check $(RUFF_FLAGS_WITH_OUTPUT_FORMAT) $${RUFF_FILES_TMP[@]} || true; \
			$(RUFF) check --fix-only $(RUFF_FLAGS) $${RUFF_FILES_TMP[@]} 2>/dev/null; \
			exit 1; \
		}; \
		$(RUFF) format --diff $(RUFF_FLAGS) $${RUFF_FILES_TMP[@]} || { \
			$(RUFF) format $(RUFF_FLAGS_WITH_OUTPUT_FORMAT) $${RUFF_FILES_TMP[@]} 2>/dev/null; \
			exit 1; \
		}; \
	}


.PHONY: check/ruff/%
check/ruff/%:
	$(RUFF) check --diff $(RUFF_FLAGS) $* || { \
		[[ -z "$${GITHUB_ACTIONS:-}" ]] || \
			$(RUFF) check $(RUFF_FLAGS_WITH_OUTPUT_FORMAT) $* || true; \
		$(RUFF) check --fix-only $(RUFF_FLAGS) $* 2>/dev/null; \
		exit 1; \
	}; \
	$(RUFF) format --diff $(RUFF_FLAGS) $* || { \
		$(RUFF) format $(RUFF_FLAGS_WITH_OUTPUT_FORMAT) $* 2>/dev/null; \
		exit 1; \
	}
