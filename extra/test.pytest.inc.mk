PYTEST ?= $(call which,PYTEST,pytest)
ifeq (PYTEST_NOT_FOUND,$(PYTEST))
export PYTEST_VSN ?= >=9.0.0,<10.0.0
PYTEST = $(UV) run pytest
else
$(call make-lazy,PYTEST)
endif

PYTEST_FLAGS += \

PYTEST_FILES += \
	$(PYTEST_FILES_EXT) \

PYTEST_FILES_EXT = $(shell $(GIT_LS_NOSYM) | $(GREP) -e "test_.*\.py$$" -e "_test\.py$$")

PYTEST_FILES_FILTER_OUT += \
	$(DEFAULT_FILES_FILTER_OUT) \

# ------------------------------------------------------------------------------

.PHONY: debug/pytest
debug/pytest:
	$(ECHO)
	$(ECHO_DO) "Debug pytest..."
	$(ECHO) "PYTEST=$(PYTEST)"
	$(ECHO) "PYTEST_FILES=$(PYTEST_FILES)"
	$(ECHO) "PYTEST_FILES_EXT=$(PYTEST_FILES_EXT)"
	$(ECHO) "PYTEST_FILES_FILTER_OUT=$(PYTEST_FILES_FILTER_OUT)"
	$(ECHO) "PYTEST_FLAGS=$(PYTEST_FLAGS)"
	set -x && $(PYTEST) --version || true
	$(ECHO_DONE)


.PHONY: test/pytest
test/pytest:
	PYTEST_FILES_TMP=($(filter-out $(PYTEST_FILES_FILTER_OUT), $(PYTEST_FILES))); \
	[[ "$${#PYTEST_FILES_TMP[@]}" = "0" ]] || { \
		$(PYTEST) $(PYTEST_FLAGS) $${PYTEST_FILES_TMP[@]}; \
	}
