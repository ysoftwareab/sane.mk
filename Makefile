include sane.extra.mk

DEFAULT_FILES_FILTER_OUT += \
	$(wildcard bin/transcrypt@*/transcrypt) \
	gitconfig/dot.gitattributes_global \
	gitconfig/dot.gitignore_global \

JSCPD_FILES_FILTER_OUT += \
	sane.extra.mk.tpl \
	sane.std.mk.tpl \

SANE_BUILD += \
	gitconfig/dot.gitattributes_global \
	gitconfig/dot.gitignore_global \

SANE_DIST += \
	dist/mk \

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


.PHONY: dist/mk
dist/mk:
	$(MKDIR) dist
	$(CP) sane.mk dist/
	$(CP) template/tf.mk dist/template.tf.mk
	./sane.std.mk.tpl > dist/sane.std.mk
	./sane.extra.mk.tpl > dist/sane.extra.mk
