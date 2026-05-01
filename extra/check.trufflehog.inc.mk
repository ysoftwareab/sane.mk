TRUFFLEHOG ?= $(call which,TRUFFLEHOG,trufflehog)
$(call make-lazy,TRUFFLEHOG)

# NOTE add more patterns with ,
TRUFFLEHOG_EXCLUDE_GLOBS +=

TRUFFLEHOG_FLAGS += \

# NOTE --github-actions will not print secrets in plain text
ifneq (,$(CI))
TRUFFLEHOG_FLAGS += --github-actions
endif

# ------------------------------------------------------------------------------

.PHONY: debug/trufflehog
debug/trufflehog:
	$(ECHO)
	$(ECHO_DO) "Debug TruffleHog..."
	$(ECHO) "TRUFFLEHOG=$(TRUFFLEHOG)"
	$(ECHO) "TRUFFLEHOG_EXCLUDE_GLOBS=$(TRUFFLEHOG_EXCLUDE_GLOBS)"
	$(ECHO) "TRUFFLEHOG_FLAGS=$(TRUFFLEHOG_FLAGS)"
	set -x && $(TRUFFLEHOG) --version || true
	$(ECHO_DONE)


# NOTE we are using the JSON output and removing the Raw and RawV2 fields
# because there is no other way to get an output without the raw fields,
# an output that signals
.PHONY: check/trufflehog
check/trufflehog:
	$(TRUFFLEHOG) git \
		--fail \
		--no-update \
		--no-verification \
		--branch HEAD \
		--exclude-globs "$(TRUFFLEHOG_EXCLUDE_GLOBS)" \
		$(TRUFFLEHOG_FLAGS) \
		file://$(GIT_ROOT)
