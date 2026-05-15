PYTHON_FILES_SHEBANG_PATH = .
PYTHON_FILES_EXT = $(shell $(GIT_LS) | $(GREP) -e "\.py$$" | $(NOSYM))
PYTHON_FILES_SHEBANG = \
	$(shell $(GIT_LS) $(PYTHON_FILES_SHEBANG_PATH) | \
		while read -r FILE; do \
		[[ ! -L "$${FILE}" ]] || continue; \
		[[ -f "$${FILE}" ]] || continue; \
		[[ -x "$${FILE}" ]] || continue; \
		$(HEAD) -n1 "$${FILE}" | $(GREP) "^$(hash)!/" | $(GREP) -q -e "\b\(python\|python2\|python3\|uv\)\b" || continue; \
		$(ECHO) "$${FILE}"; \
	done)
$(foreach VAR,PYTHON_FILES_EXT PYTHON_FILES_SHEBANG,$(call make-lazy-once,$(VAR)))
