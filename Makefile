include sane.extended.mk

SHELLCHECK ?= $(call which,SHELLCHECK,shellcheck)
EDITORCONFIG_CHECKER ?= $(call which,EDITORCONFIG_CHECKER,editorconfig-checker)
MARKDOWNLINT ?= $(call which,MARKDOWNLINT,markdownlint)

# ------------------------------------------------------------------------------

.PHONY: check
check:
	$(EDITORCONFIG_CHECKER)
	$(MARKDOWNLINT) -c .markdownlint.json README.md
	$(SHELLCHECK) sane.extended.mk.tpl


.PHONY: dist
dist: ## Build distribution files
	$(MKDIR) dist
	$(CP) sane.mk dist/
	./sane.extended.mk.tpl > dist/sane.extended.mk
