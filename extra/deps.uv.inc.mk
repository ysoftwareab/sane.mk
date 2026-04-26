UV = $(call which,UV,uv)
UVX = $(call which,UVX,uvx)

DEFAULT_FILES_FILTER_OUT += \
	$(shell $(GIT_LS_NOSYM) | $(GREP) -e "uv\.lock$$") \

# ------------------------------------------------------------------------------

.PHONY: debug/uv
debug/uv:
	$(ECHO)
	$(ECHO_DO) "Debug uv..."
	$(ECHO) "UV=$(UV)"
	set -x && $(UV) --version || true
	$(ECHO_DONE)


.PHONY: deps/gitignore/uv
deps/gitignore/uv:
	:


.PHONY: deps/uv
deps/uv:
ifneq (,$(wildcard uv.lock))
	$(UV) sync
else
	:
endif


.PHONY: deps/upgrade/uv
deps/upgrade/uv:
ifneq (,$(wildcard uv.lock))
	$(UV) lock --upgrade
	$(UV) sync
else
	:
endif
