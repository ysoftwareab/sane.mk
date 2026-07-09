include template/sane.extra.mk

DEFAULT_FILES_FILTER_OUT += \
	.devcontainer/devcontainer.json \
	$(wildcard bin/transcrypt@*/transcrypt) \
	gitconfig/dot.gitattributes_global \
	gitconfig/dot.gitignore_global \
	$(wildcard dist/*) \

JSCPD_FILES_FILTER_OUT += \
	template/sane.extra.mk.tpl \
	template/sane.std.mk.tpl \

SANE_BUILD += \
	.devcontainer/devcontainer.json \
	gitconfig/dot.gitattributes_global \
	gitconfig/dot.gitignore_global \

SANE_DIST += \
	dist/mk \

# ------------------------------------------------------------------------------

.PHONY: .devcontainer/devcontainer.json
.devcontainer/devcontainer.json: config/dot.vscode/extensions.json
.devcontainer/devcontainer.json: package.json
.devcontainer/devcontainer.json: .devcontainer/devcontainer.json.tpl
	$< > $@


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
	$(CP) template/sane.tf.mk dist/sane.tf.mk
	./template/sane.std.mk.tpl > dist/sane.std.mk
	./template/sane.extra.mk.tpl > dist/sane.extra.mk
