SCC ?= $(call which,SCC,scc)
$(call make-lazy,SCC)

SCC_FLAGS += \
	--ci \
	--wide \

SCC_FILES += \
	$(SCC_FILES_EXT) \

SCC_FILES_EXT = $(shell $(GIT_LS_NOSYM))

SCC_FILES_FILTER_OUT += \
	$(DEFAULT_FILES_FILTER_OUT) \

# ------------------------------------------------------------------------------

.PHONY: debug/scc
debug/scc:
	$(ECHO)
	$(ECHO_DO) "Debug SCC..."
	$(ECHO) "SCC=$(SCC)"
	$(ECHO) "SCC_FILES=$(SCC_FILES)"
	$(ECHO) "SCC_FILES_EXT=$(SCC_FILES_EXT)"
	$(ECHO) "SCC_FILES_FILTER_OUT=$(SCC_FILES_FILTER_OUT)"
	$(ECHO) "SCC_FLAGS=$(SCC_FLAGS)"
	set -x && $(SCC) --version || true
	$(ECHO_DONE)


.PHONY: tool/scc
tool/scc:
	SCC_FILES_TMP=($(filter-out $(SCC_FILES_FILTER_OUT), $(SCC_FILES))); \
	[[ "$${#SCC_FILES_TMP[@]}" = "0" ]] || { \
		$(SCC) $(SCC_FLAGS) $${SCC_FILES_TMP[@]}; \
	}
