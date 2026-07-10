PYREFLY ?= $(call which,PYREFLY,pyrefly)
ifeq (PYREFLY_NOT_FOUND,$(PYREFLY))
export PYREFLY_VSN ?= >=1.0.0,<2.0.0
PYREFLY = $(UVX) pyrefly$(PYREFLY_VSN)
else
$(call make-lazy-once,PYREFLY)
endif

PYREFLY_FLAGS += \

PYREFLY_FILES += \
	$(PYREFLY_FILES_EXT) \
	$(PYREFLY_FILES_SHEBANG) \

PYREFLY_FILES_EXT = $(PYTHON_FILES_EXT)

PYREFLY_FILES_SHEBANG_PATH = .

PYREFLY_FILES_SHEBANG = $(PYTHON_FILES_SHEBANG)

PYREFLY_FILES_FILTER_OUT += \
	$(DEFAULT_FILES_FILTER_OUT) \

# ------------------------------------------------------------------------------

.PHONY: debug/pyrefly
debug/pyrefly:
	$(ECHO)
	$(ECHO_DO) "Debug pyrefly..."
	$(ECHO) "PYREFLY=$(PYREFLY)"
	$(ECHO) "PYREFLY_FILES=$(PYREFLY_FILES)"
	$(ECHO) "PYREFLY_FILES_EXT=$(PYREFLY_FILES_EXT)"
	$(ECHO) "PYREFLY_FILES_FILTER_OUT=$(PYREFLY_FILES_FILTER_OUT)"
	$(ECHO) "PYREFLY_FILES_SHEBANG=$(PYREFLY_FILES_SHEBANG)"
	$(ECHO) "PYREFLY_FLAGS=$(PYREFLY_FLAGS)"
	set -x && $(PYREFLY) --version || true
	$(ECHO_DONE)


.PHONY: check/pyrefly
check/pyrefly:
ifneq (,$(wildcard pyproject.toml))
	PYREFLY_FILES_TMP=($(filter-out $(PYREFLY_FILES_FILTER_OUT), $(PYREFLY_FILES))); \
	[[ "$${#PYREFLY_FILES_TMP[@]}" = "0" ]] || { \
		$(PYREFLY) check $(PYREFLY_FLAGS) $${PYREFLY_FILES_TMP[@]} || exit 1; \
	}
else
	:
endif


.PHONY: check/pyrefly/%
check/pyrefly/%:
ifneq (,$(wildcard pyproject.toml))
	$(PYREFLY) check $(PYREFLY_FLAGS) $* || exit 1
else
	:
endif
