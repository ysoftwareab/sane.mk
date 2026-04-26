include sane.extended.mk

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
	$(MARKDOWNLINT) -c .markdownlint.json README.md


.PHONY: check/shellcheck
check/shellcheck:
	$(SHELLCHECK) sane.extended.mk.tpl


.PHONY: dist
dist: ## Build distribution files
	$(MKDIR) dist
	$(CP) sane.mk dist/
	./sane.extended.mk.tpl > dist/sane.extended.mk
