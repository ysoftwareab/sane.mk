include sane.extra.mk

DEFAULT_FILES_FILTER_OUT += \
	$(wildcard bin/transcrypt@*/transcrypt) \

JSCPD_FILES_FILTER_OUT += \
	sane.extra.mk.tpl \
	sane.std.mk.tpl \

SANE_BUILD += \
	gitconfig/dot.gitattributes_global \
	gitconfig/dot.gitignore_global \

# ------------------------------------------------------------------------------

.PHONY: gitconfig/dot.gitattributes_global
gitconfig/dot.gitattributes_global: gitconfig/dot.gitattributes_global.tpl
gitconfig/dot.gitattributes_global: gitconfig/dot.gitattributes_global.base
gitconfig/dot.gitattributes_global:
	$< > $@


.PHONY: gitconfig/dot.gitignore_global
gitconfig/dot.gitignore_global: gitconfig/dot.gitignore_global.tpl
gitconfig/dot.gitignore_global: gitconfig/dot.gitignore_global.base
gitconfig/dot.gitignore_global:
	$< > $@


.PHONY: dist
dist: ## Build distribution files
	$(MKDIR) dist
	$(CP) sane.mk dist/
	./sane.std.mk.tpl > dist/sane.std.mk
	./sane.extra.mk.tpl > dist/sane.extra.mk
