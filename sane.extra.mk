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

-include Makefile.lazy

# BEGIN # extra

include $(SANE_MK_ROOT)/extra/target.password.inc.mk
include $(SANE_MK_ROOT)/extra/target.transcrypt.inc.mk
include $(SANE_MK_ROOT)/extra/target.version.inc.mk

include $(SANE_MK_ROOT)/extra/deps.brewfile.inc.mk
include $(SANE_MK_ROOT)/extra/deps.corepack.inc.mk
include $(SANE_MK_ROOT)/extra/deps.uv.inc.mk
include $(SANE_MK_ROOT)/extra/deps.vscode.inc.mk

include $(SANE_MK_ROOT)/extra/check.actionlint.inc.mk
include $(SANE_MK_ROOT)/extra/check.editorconfig-checker.inc.mk
include $(SANE_MK_ROOT)/extra/check.jscpd.inc.mk
include $(SANE_MK_ROOT)/extra/check.markdownlint.inc.mk
include $(SANE_MK_ROOT)/extra/check.ruff.inc.mk
include $(SANE_MK_ROOT)/extra/check.scc.inc.mk
include $(SANE_MK_ROOT)/extra/check.shellcheck.inc.mk
include $(SANE_MK_ROOT)/extra/check.shfmt.inc.mk
include $(SANE_MK_ROOT)/extra/check.trufflehog.inc.mk
include $(SANE_MK_ROOT)/extra/check.yamllint.inc.mk

SANE_DEBUG_CHECK += \
	debug/brew \
	debug/editorconfig-checker \
	debug/jscpd \
	debug/markdownlint \
	debug/ruff \
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
	.ruff.toml \
	.shellcheckrc \
	.yamllint \

SANE_DEBUG_DEPS += \
	debug/corepack \
	debug/uv \
	debug/vscode \

SANE_CHECK_LINTERS += \
	check/actionlint \
	check/editorconfig-checker \
	check/markdownlint \
	check/ruff \
	check/shellcheck \
	check/shfmt \
	check/yamllint \

SANE_CHECK_INFOSEC += \
	check/trufflehog \

# NOTE jscpd is slow. Disabled
# NOTE scc is slow and it will also never fail. Disabled
SANE_CHECK_MISC += \
	noop/check/jscpd \
	noop/check/scc \

SANE_CHECK += \
	$(SANE_CHECK_LINTERS) \
	$(SANE_CHECK_INFOSEC) \
	$(SANE_CHECK_MISC) \

SANE_DEBUG_OS ?=
SANE_DEBUG_ENV ?=
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
	$(CP) $(SANE_MK_ROOT)/config/dot$@ $@

.mailmap:
	$(TOUCH) $@

.markdownlint.json:
	$(LN) -s $(SANE_MK_ROOT)/config/dot$@ $@

.ruff.toml:
	$(LN) -s $(SANE_MK_ROOT)/config/dot$@ $@

.shellcheckrc:
	$(LN) -s $(SANE_MK_ROOT)/config/dot$@ $@

.yamllint:
	$(LN) -s $(SANE_MK_ROOT)/config/dot$@ $@

# END # extra

include $(SANE_MK_ROOT)/target.std.inc.mk
include $(SANE_MK_ROOT)/misc.lazy.inc.mk

# END # includes

SANE_MK_INCLUDED := 1

endif
