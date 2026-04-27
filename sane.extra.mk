ifndef SANE_MK_INCLUDED

ifndef SANE_MK_ROOT
SANE_MK_ROOT := $(shell dirname $(abspath $(lastword $(MAKEFILE_LIST))))
endif

# BEGIN # includes

include $(SANE_MK_ROOT)/sane.mk

include $(SANE_MK_ROOT)/exe.which.inc.mk # needed by the other exe.*.inc.mk files
include $(SANE_MK_ROOT)/exe.echo.inc.mk
include $(SANE_MK_ROOT)/exe.gnu.inc.mk
include $(SANE_MK_ROOT)/exe.misc.inc.mk

include $(SANE_MK_ROOT)/misc.chars.inc.mk
include $(SANE_MK_ROOT)/misc.git.inc.mk
include $(SANE_MK_ROOT)/misc.github.inc.mk
include $(SANE_MK_ROOT)/misc.os.inc.mk
include $(SANE_MK_ROOT)/misc.source-const.inc.mk

include $(SANE_MK_ROOT)/target.brew.inc.mk
include $(SANE_MK_ROOT)/target.env.inc.mk
include $(SANE_MK_ROOT)/target.help.inc.mk
include $(SANE_MK_ROOT)/target.lazy.inc.mk
include $(SANE_MK_ROOT)/target.noop.inc.mk
include $(SANE_MK_ROOT)/target.printvar.inc.mk
include $(SANE_MK_ROOT)/target.shell.inc.mk
include $(SANE_MK_ROOT)/target.verbose.inc.mk

# BEGIN # extra

include $(SANE_MK_ROOT)/extra/target.password.inc.mk
include $(SANE_MK_ROOT)/extra/target.transcrypt.inc.mk
include $(SANE_MK_ROOT)/extra/target.version.inc.mk

include $(SANE_MK_ROOT)/extra/deps.brewfile.inc.mk
include $(SANE_MK_ROOT)/extra/deps.corepack.inc.mk
include $(SANE_MK_ROOT)/extra/deps.uv.inc.mk
include $(SANE_MK_ROOT)/extra/deps.vscode.inc.mk

include $(SANE_MK_ROOT)/extra/check.actionlint.inc.mk
include $(SANE_MK_ROOT)/extra/check.black.inc.mk
include $(SANE_MK_ROOT)/extra/check.editorconfig-checker.inc.mk
include $(SANE_MK_ROOT)/extra/check.jscpd.inc.mk
include $(SANE_MK_ROOT)/extra/check.markdownlint.inc.mk
include $(SANE_MK_ROOT)/extra/check.scc.inc.mk
include $(SANE_MK_ROOT)/extra/check.shellcheck.inc.mk
include $(SANE_MK_ROOT)/extra/check.shfmt.inc.mk
include $(SANE_MK_ROOT)/extra/check.trufflehog.inc.mk
include $(SANE_MK_ROOT)/extra/check.yamllint.inc.mk

# END # extra

include $(SANE_MK_ROOT)/target.std.inc.mk

include $(SANE_MK_ROOT)/misc.lazy.inc.mk

# END # includes

SANE_DEBUG_CHECK += \
	debug/brew \
	debug/black	\
	debug/editorconfig-checker \
	debug/jscpd \
	debug/markdownlint \
	debug/scc \
	debug/shellcheck \
	debug/shfmt \
	debug/trufflehog \
	debug/yamllint \

SANE_DEPS_SYSTEM += \
	deps/system/brewfile \

SANE_DEPS += \
	deps/corepack \
	deps/uv \
	deps/vscode \

SANE_DEPS_FILES += \
	.editorconfig \
	.gitignore \
	.gitattributes \
	.mailmap \
	.markdownlint.json \
	.shellcheckrc \
	.yamllint \

SANE_DEBUG_DEPS += \
	debug/corepack \
	debug/uv \
	debug/vscode \

SANE_CHECK += \
	check/actionlint \
	check/ai-slop-detector \
	check/black \
	check/editorconfig-checker \
	check/jscpd \
	check/markdownlint \
	check/scc \
	check/shellcheck \
	check/shfmt \
	check/trufflehog \
	check/yamllint \

SANE_DEBUG += \
	$(SANE_DEBUG_OS) \
	$(SANE_DEBUG_ENV) \
	$(SANE_DEBUG_DEPS) \
	$(SANE_DEBUG_CHECK) \

.editorconfig:
	$(LN) -s $(SANE_MK_ROOT)/config/dot$@ $@

.gitignore:
	$(CP) $(SANE_MK_ROOT)/config/dot$@ $@

.gitattributes:
	$(LN) -s $(SANE_MK_ROOT)/config/$@ $@

.mailmap:
	$(TOUCH) $@

.markdownlint.json:
	$(LN) -s $(SANE_MK_ROOT)/config/dot$@ $@

.shellcheckrc:
	$(LN) -s $(SANE_MK_ROOT)/config/dot$@ $@

.yamllint:
	$(LN) -s $(SANE_MK_ROOT)/config/dot$@ $@

SANE_MK_INCLUDED := 1

endif
