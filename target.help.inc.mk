# editorconfig-checker-disable max-line-length

.PHONY: help
help: help/main
help: ## Show this help message.
	:


.PHONY: help/main
help/main:
	$(eval RANDOM_MARKER := $(shell $(HEXDUMP) -n 16 -e '4/4 "%08X" 1 "\n"' /dev/random))
	@$(ECHO)
	@$(ECHO) "usage: $(MAKE:$(firstword $(MAKE))=$$(basename $(firstword $(MAKE)))) [targets]"
#	print any manual instructions
	@$(ECHO)
	@for Makefile in $(MAKEFILE_LIST); do \
		$(CAT) $${Makefile} | \
		$(SED) "s|^##[[:space:]]\{1,\}\(.\{1,\}\)\$$|$(RANDOM_MARKER)  \1|g" | \
		$(SED) "s|^##\$$|$(RANDOM_MARKER)|g"; \
	done | \
		{ $(GREP) "^$(RANDOM_MARKER)" || true; } | \
		$(SED) "s|^$(RANDOM_MARKER)||g" | \
		$(COLUMN) -t -s "##"
#	print main targets
	@$(ECHO)
	@$(ECHO) "Main targets:"
	@for Makefile in $(MAKEFILE_LIST); do \
		$(CAT) $${Makefile} | \
		$(SED) "s|^\([^#.\$$\t][^=]\{1,\}\):[^=]\{0,\}[[:space:]]##[[:space:]]\{1,\}\(.\{1,\}\)\$$|$(RANDOM_MARKER)  \1##\2|g"; \
	done | \
		{ $(GREP) "^$(RANDOM_MARKER)" || true; } | \
		$(SED) "s|^$(RANDOM_MARKER)||g" | \
		$(SORT) -u | \
		$(COLUMN) -t -s "##"
	@$(ECHO)


.PHONY: help/all
help/all: ## Show this help message, including all targets and source Makefiles.
	$(eval RANDOM_MARKER := $(shell $(HEXDUMP) -n 16 -e '4/4 "%08X" 1 "\n"' /dev/random))
	@$(ECHO)
	@$(ECHO) "usage: $(MAKE:$(firstword $(MAKE))=$$(basename $(firstword $(MAKE)))) [targets]"
#	print any manual instructions
	@$(ECHO)
	@for Makefile in $(MAKEFILE_LIST); do \
		$(CAT) $${Makefile} | \
		$(SED) "s|^##[[:space:]]\{1,\}\(.\{1,\}\)\$$|$(RANDOM_MARKER)  \1|g" | \
		$(SED) "s|^##\$$|$(RANDOM_MARKER)|g"; \
	done | \
		{ $(GREP) "^$(RANDOM_MARKER)" || true; } | \
		$(SED) "s|^$(RANDOM_MARKER)||g" | \
		$(COLUMN) -t -s "##"
#	print all targets
	@$(ECHO)
	@$(ECHO) "Available targets:"
	@for Makefile in $(MAKEFILE_LIST); do \
		$(CAT) $${Makefile} | \
		$(SED) "s|^\([^#.\$$\t][^=]\{1,\}\):[^#]\{0,\}\$$|$(RANDOM_MARKER)  \1##$${Makefile#$(MAKE_PATH)/}##|g" | \
		$(SED) "s|^\([^#.\$$\t][^=]\{1,\}\):[^#]\{0,\}\([[:space:]]##[[:space:]]\{1,\}\(.\{1,\}\)\)\?\$$|$(RANDOM_MARKER)  \1##$${Makefile#$(MAKE_PATH)/}##\3|g"; \
	done | \
		{ $(GREP) "^$(RANDOM_MARKER)" || true; } | \
		$(SED) "s|^$(RANDOM_MARKER)||g" | \
		$(SORT) -u | \
		$(COLUMN) -t -s "##"
	@$(ECHO)

# editorconfig-checker-enable max-line-length
