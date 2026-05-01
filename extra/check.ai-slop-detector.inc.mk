AI_SLOP_DETECTOR ?= $(call which,AI_SLOP_DETECTOR,ai-slop-detector)
ifeq (AI_SLOP_DETECTOR_NOT_FOUND,$(AI_SLOP_DETECTOR))
AI_SLOP_DETECTOR = $(UVX) "ai-slop-detector[full]"
else
$(call make-lazy,AI_SLOP_DETECTOR)
endif

AI_SLOP_DETECTOR_FLAGS += \
	--ci-mode hard \

AI_SLOP_DETECTOR_FILES += \
	$(AI_SLOP_DETECTOR_FILES_EXT) \
	$(AI_SLOP_DETECTOR_FILES_SHEBANG) \

AI_SLOP_DETECTOR_FILES_EXT = $(shell $(GIT_LS_NOSYM) \
	| $(GREP) -e "\.jsx?$$" -e "\.py$$" -e "\.tsx?$$")

AI_SLOP_DETECTOR_FILES_SHEBANG_PATH = .

AI_SLOP_DETECTOR_FILES_SHEBANG = \
	$(shell $(call git_ls_nosym,$(AI_SLOP_DETECTOR_FILES_SHEBANG_PATH)) | \
		while read -r FILE; do \
		[[ ! -L "$${FILE}" ]] || continue; \
		[[ -f "$${FILE}" ]] || continue; \
		[[ -x "$${FILE}" ]] || continue; \
		$(HEAD) -n1 "$${FILE}" | $(GREP) "^$(hash)!/" \
			| $(GREP) -q -e "\b\(bun\|node\|python\|python2\|python3\|ts-node\|uv\)\b" || continue; \
		$(ECHO) "$${FILE}"; \
	done)

AI_SLOP_DETECTOR_FILES_FILTER_OUT += \
	$(DEFAULT_FILES_FILTER_OUT) \

# ------------------------------------------------------------------------------

.PHONY: debug/ai-slop-detector
debug/ai-slop-detector:
	$(ECHO)
	$(ECHO_DO) "Debug AI-SLOP-Detector..."
	$(ECHO) "AI_SLOP_DETECTOR=$(AI_SLOP_DETECTOR)"
	$(ECHO) "AI_SLOP_DETECTOR_FILES=$(AI_SLOP_DETECTOR_FILES)"
	$(ECHO) "AI_SLOP_DETECTOR_FILES_EXT=$(AI_SLOP_DETECTOR_FILES_EXT)"
	$(ECHO) "AI_SLOP_DETECTOR_FILES_FILTER_OUT=$(AI_SLOP_DETECTOR_FILES_FILTER_OUT)"
	$(ECHO) "AI_SLOP_DETECTOR_FILES_SHEBANG=$(AI_SLOP_DETECTOR_FILES_SHEBANG)"
	$(ECHO) "AI_SLOP_DETECTOR_FLAGS=$(AI_SLOP_DETECTOR_FLAGS)"
	set -x && $(AI_SLOP_DETECTOR) --version || true
	$(ECHO_DONE)


.PHONY: check/ai-slop-detector
check/ai-slop-detector:
	AI_SLOP_DETECTOR_FILES_TMP=($(filter-out $(AI_SLOP_DETECTOR_FILES_FILTER_OUT), $(AI_SLOP_DETECTOR_FILES))); \
	[[ "$${#AI_SLOP_DETECTOR_FILES_TMP[@]}" = "0" ]] || { \
		$(AI_SLOP_DETECTOR) $(AI_SLOP_DETECTOR_FLAGS) --project .; \
	}
