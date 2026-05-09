# Use Homebrew to install dependencies on macOS/Linux.
# For extensibility, the Brewfile is processed with
# envsubst-like variable substitution and support for # source directives.

BREWFILE = Brewfile
BREWFILE_SH = Brewfile.sh
BREWFILE_TEST = Brewfile.test

CAT_BREWFILE = \
	$(CAT) $(BREWFILE) \
		| $(SED) "s/\$${?ARCH}?/$(ARCH)/g" \
		| $(SED) "s/\$${?ARCH_SHORT}?/$(ARCH_SHORT)/g" \
		| $(SED) "s/\$${?HOST}?/$(HOST)/g" \
		| $(SED) "s/\$${?HOST_SHORT}?/$(HOST_SHORT)/g" \
		| $(SED) "s/\$${?OS_SHORT}?/$(OS_SHORT)/g" \
		| $(SED) "s/\$${?OS}?/$(OS)/g" \
		| $(SED) "s/^$(hash) source \\(.\\+\\)$$/cat \1/e" \
		| $(SED) "s/^$(hash) source \\(.\\+\\)$$/cat \1/e" \
		| $(SED) "s/^$(hash) source \\(.\\+\\)$$/cat \1/e"

# ------------------------------------------------------------------------------

.PHONY: deps/system/brewfile
deps/system/brewfile:
ifneq (,$(wildcard $(BREWFILE)))
	unset GITHUB_ACTIONS; \
	$(CAT_BREWFILE) \
		| brew bundle install --verbose --file=-
ifneq (,$(wildcard $(BREWFILE_SH)))
	OS=$(OS) OS_SHORT=$(OS_SHORT) ARCH=$(ARCH) ARCH_SHORT=$(ARCH_SHORT) HOST=$(HOST) ./$(BREWFILE_SH)
endif
else
	:
endif


.PHONY: test/system/brewfile
test/system/brewfile:
ifneq (,$(wildcard $(BREWFILE)))
	unset GITHUB_ACTIONS; \
	$(CAT_BREWFILE) \
		| brew bundle check --verbose --file=-
ifneq (,$(wildcard $(BREWFILE_TEST)))
	OS=$(OS) OS_SHORT=$(OS_SHORT) ARCH=$(ARCH) ARCH_SHORT=$(ARCH_SHORT) HOST=$(HOST) ./$(BREWFILE_TEST)
endif
else
	:
endif
