BATS ?= $(call which,BATS,bats)
$(call make-lazy,BATS)

BATS_VARS = \
	SANE_MK_ROOT=$(SANE_MK_ROOT) \

BATS_JOBS ?= $(shell $(NPROC))
BATS_FLAGS += \
	--jobs $(BATS_JOBS) \
	--line-reference-format colon \

# prefer cat over the default tap in CI (default pretty in non-CI; requires $TERM)
ifneq (,$(CI))
BATS_FLAGS += \
	--formatter cat
endif

ifeq (true,$(VERBOSE))
BATS_FLAGS += \
	--verbose-run \
	--trace
endif

BATS_FILES += \
	$(BATS_FILES_EXT) \
	$(BATS_FILES_SHEBANG) \

BATS_FILES_EXT = $(shell $(GIT_LS) | $(GREP) -e "\.bats$$" | $(NOSYM))

BATS_FILES_SHEBANG_PATH = .

BATS_FILES_SHEBANG = \
	$(shell $(GIT_LS) $(BATS_FILES_SHEBANG_PATH) | \
		while read -r FILE; do \
		[[ ! -L "$${FILE}" ]] || continue; \
		[[ -f "$${FILE}" ]] || continue; \
		[[ -x "$${FILE}" ]] || continue; \
		$(HEAD) -n1 "$${FILE}" | $(GREP) "^$(hash)!/" | $(GREP) -q -e "\b\(bats\)\b" || continue; \
		$(ECHO) "$${FILE}"; \
	done)

BATS_FILES_FILTER_OUT += \
	$(DEFAULT_FILES_FILTER_OUT) \

# ------------------------------------------------------------------------------

.PHONY: debug/bats
debug/bats:
	$(ECHO)
	$(ECHO_DO) "Debug BATS..."
	$(ECHO) "BATS=$(BATS)"
	$(ECHO) "BATS_FILES=$(BATS_FILES)"
	$(ECHO) "BATS_FILES_EXT=$(BATS_FILES_EXT)"
	$(ECHO) "BATS_FILES_FILTER_OUT=$(BATS_FILES_FILTER_OUT)"
	$(ECHO) "BATS_FILES_SHEBANG=$(BATS_FILES_SHEBANG)"
	$(ECHO) "BATS_FLAGS=$(BATS_FLAGS)"
	set -x && $(BATS) --version || true
	$(ECHO_DONE)


.PHONY: test/bats
test/bats:
	BATS_FILES_TMP=($(filter-out $(BATS_FILES_FILTER_OUT), $(BATS_FILES))); \
	[[ "$${#BATS_FILES_TMP[@]}" = "0" ]] || { \
		$(BATS_VARS) $(BATS) $(BATS_FLAGS) $${BATS_FILES_TMP[@]}; \
	}
