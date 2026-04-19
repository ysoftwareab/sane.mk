include sane.std.mk

SANE_CHECK += \
	check/editorconfig-checker \
	check/markdownlint \
	check/shellcheck \

SHELLCHECK ?= $(call which,SHELLCHECK,shellcheck)
EDITORCONFIG_CHECKER ?= $(call which,EDITORCONFIG_CHECKER,editorconfig-checker)
MARKDOWNLINT ?= $(call which,MARKDOWNLINT,markdownlint)

# ------------------------------------------------------------------------------

.PHONY: check/editorconfig-checker
check/editorconfig-checker:
	$(EDITORCONFIG_CHECKER)


.PHONY: check/markdownlint
check/markdownlint:
	$(MARKDOWNLINT) -c .markdownlint.json *.md


.PHONY: check/shellcheck
check/shellcheck:
	$(SHELLCHECK) *.mk.tpl


.PHONY: dist
dist: ## Build distribution files
	$(MKDIR) dist
	$(CP) sane.mk dist/
	./sane.std.mk.tpl > dist/sane.std.mk
	./sane.extra.mk.tpl > dist/sane.extra.mk
