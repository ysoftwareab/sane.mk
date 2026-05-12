JSCPD ?= $(call which,JSCPD,jscpd)
ifeq (JSCPD_NOT_FOUND,$(JSCPD))
JSCPD = $(NPX) --yes jscpd
else
$(call make-lazy,JSCPD)
endif

JSCPD_FLAGS += \
	--blame \
	--exitCode 1 \
	--gitignore \
	--reporters silent \

JSCPD_FILES += \
	$(JSCPD_FILES_EXT) \

JSCPD_FILES_EXT = $(shell $(GIT_LS) | $(NOSYM))

JSCPD_FILES_FILTER_OUT += \
	$(DEFAULT_FILES_FILTER_OUT) \

# ------------------------------------------------------------------------------

.PHONY: debug/jscpd
debug/jscpd:
	$(ECHO)
	$(ECHO_DO) "Debug JSCPD..."
	$(ECHO) "JSCPD=$(JSCPD)"
	$(ECHO) "JSCPD_FILES=$(JSCPD_FILES)"
	$(ECHO) "JSCPD_FILES_EXT=$(JSCPD_FILES_EXT)"
	$(ECHO) "JSCPD_FILES_FILTER_OUT=$(JSCPD_FILES_FILTER_OUT)"
	$(ECHO) "JSCPD_FLAGS=$(JSCPD_FLAGS)"
	set -x && $(JSCPD) --version || true
	$(ECHO_DONE)


.PHONY: check/jscpd
check/jscpd:
	JSCPD_FILES_TMP=($(filter-out $(JSCPD_FILES_FILTER_OUT), $(JSCPD_FILES))); \
	[[ "$${#JSCPD_FILES_TMP[@]}" = "0" ]] || { \
		$(JSCPD) $(JSCPD_FLAGS) $${JSCPD_FILES_TMP[@]}; \
	}
