TY ?= $(call which,TY,ty)
ifeq (TY_NOT_FOUND,$(TY))
export TY_VSN ?= >=0.0.35,<0.1.0
TY = $(UVX) ty$(TY_VSN)
else
$(call make-lazy,TY)
endif

TY_FLAGS += \

TY_FILES += \
	$(TY_FILES_EXT) \
	$(TY_FILES_SHEBANG) \

TY_FILES_EXT = $(PYTHON_FILES_EXT)

TY_FILES_SHEBANG_PATH = .

TY_FILES_SHEBANG = $(PYTHON_FILES_SHEBANG)

TY_FILES_FILTER_OUT += \
	$(DEFAULT_FILES_FILTER_OUT) \

# ------------------------------------------------------------------------------

.PHONY: debug/ty
debug/ty:
	$(ECHO)
	$(ECHO_DO) "Debug ty..."
	$(ECHO) "TY=$(TY)"
	$(ECHO) "TY_FILES=$(TY_FILES)"
	$(ECHO) "TY_FILES_EXT=$(TY_FILES_EXT)"
	$(ECHO) "TY_FILES_FILTER_OUT=$(TY_FILES_FILTER_OUT)"
	$(ECHO) "TY_FILES_SHEBANG=$(TY_FILES_SHEBANG)"
	$(ECHO) "TY_FLAGS=$(TY_FLAGS)"
	set -x && $(TY) --version || true
	$(ECHO_DONE)


.PHONY: check/ty
check/ty:
	TY_FILES_TMP=($(filter-out $(TY_FILES_FILTER_OUT), $(TY_FILES))); \
	[[ "$${#TY_FILES_TMP[@]}" = "0" ]] || { \
		$(TY) check $(TY_FLAGS) $${TY_FILES_TMP[@]} || { \
			[[ -z "$${GITHUB_ACTIONS:-}" ]] || \
				$(TY) check --output-format github $(TY_FLAGS) $${TY_FILES_TMP[@]} || true; \
			exit 1; \
		}; \
	}
