BLACK ?= $(call which,BLACK,black)

BLACK_FLAGS += \
	--line-length 120 \

BLACK_FILES += \
	$(BLACK_FILES_EXT) \
	$(BLACK_FILES_SHEBANG) \

BLACK_FILES_EXT = $(shell $(GIT_LS_NOSYM) | $(GREP) -e "\.py$$")

BLACK_FILES_SHEBANG_PATH = .

BLACK_FILES_SHEBANG = \
	$(shell $(GIT_LS_NOSYM) $(BLACK_FILES_SHEBANG_PATH) | \
		while read -r FILE; do \
		[[ ! -L "$${FILE}" ]] || continue; \
		[[ -f "$${FILE}" ]] || continue; \
		[[ -x "$${FILE}" ]] || continue; \
		$(HEAD) -n1 "$${FILE}" | $(GREP) "^$(hash)!/" | $(GREP) -q -e "\b\(python\|python2\|python3\|uv\)\b" || continue; \
		$(ECHO) "$${FILE}"; \
	done)

BLACK_FILES_FILTER_OUT += \
	$(DEFAULT_FILES_FILTER_OUT) \

# ------------------------------------------------------------------------------

.PHONY: debug/black
debug/black:
	$(ECHO)
	$(ECHO_DO) "Debug Black..."
	$(ECHO) "BLACK=$(BLACK)"
	$(ECHO) "BLACK_FILES=$(BLACK_FILES)"
	$(ECHO) "BLACK_FILES_EXT=$(BLACK_FILES_EXT)"
	$(ECHO) "BLACK_FILES_FILTER_OUT=$(BLACK_FILES_FILTER_OUT)"
	$(ECHO) "BLACK_FILES_SHEBANG=$(BLACK_FILES_SHEBANG)"
	$(ECHO) "BLACK_FLAGS=$(BLACK_FLAGS)"
	set -x && $(BLACK) --version || true
	$(ECHO_DONE)


.PHONY: check/black
check/black:
	BLACK_FILES_TMP=($(filter-out $(BLACK_FILES_FILTER_OUT), $(BLACK_FILES))); \
	[[ "$${#BLACK_FILES_TMP[@]}" = "0" ]] || { \
		$(BLACK) --check --diff $(BLACK_FLAGS) $${BLACK_FILES_TMP[@]} || { \
			$(BLACK) $(BLACK_FLAGS) $${BLACK_FILES_TMP[@]}; \
			exit 1; \
		}; \
	}
