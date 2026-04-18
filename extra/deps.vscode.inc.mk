CODE = $(call which,CODE,code)

ifeq (CODE_NOT_FOUND,$(CODE))
# ignore if no vscode installed
VSCODE_EXTENSIONS_JSON =
else
VSCODE_EXTENSIONS_JSON = $(wildcard $(GIT_ROOT)/.vscode/extensions.json)
endif

VSCODE_EXTENSIONS_INSTALL = $(shell \
	$(COMM) -23 \
	<($(CAT) "$(VSCODE_EXTENSIONS_JSON)" \
		| $(STRIP_JSON_COMMENTS) \
		| $(JQ) -r -e ".recommendations[]" \
		| $(TR) "[:upper:]" "[:lower:]" \
		| $(SORT) -u) \
	<("$(CODE)" --list-extensions \
		| $(TR) "[:upper:]" "[:lower:]" \
		| $(SORT) -u))

# ------------------------------------------------------------------------------

.PHONY: debug/vscode
debug/vscode:
	$(ECHO)
	$(ECHO_DO) "Debug Visual Studio Code..."
	$(ECHO) "CODE=$(CODE)"
	set -x && "$(CODE)" --version || true
	set -x && "$(CODE)" --list-extensions --show-versions || true
	$(ECHO_DONE)


.PHONY: deps/gitignore/vscode
deps/gitignore/vscode:
	:


.PHONY: deps/vscode
deps/vscode:
ifneq (,$(VSCODE_EXTENSIONS_JSON))
ifeq (,$(CI))
	for EXTENSION in $(VSCODE_EXTENSIONS_INSTALL); do \
		$(ECHO_INFO) "Installing vscode extension $${EXTENSION} ..."; \
		"$(CODE)" --install-extension $${EXTENSION} >/dev/null; \
	done
	"$(CODE)" --update-extensions
else
	for EXTENSION in $(VSCODE_EXTENSIONS_INSTALL); do \
		$(ECHO_SKIP) "Installing vscode extension $${EXTENSION} ..."; \
	done
endif
else
	:
endif
