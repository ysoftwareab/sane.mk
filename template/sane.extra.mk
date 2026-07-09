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
include $(SANE_MK_ROOT)/target.std.inc.mk
include $(SANE_MK_ROOT)/target.verbose.inc.mk

-include Makefile.lazy

# BEGIN # extra

include $(SANE_MK_ROOT)/extra/misc.password.inc.mk
include $(SANE_MK_ROOT)/extra/misc.python.inc.mk
include $(SANE_MK_ROOT)/extra/misc.transcrypt.inc.mk
include $(SANE_MK_ROOT)/extra/misc.version.inc.mk

include $(SANE_MK_ROOT)/extra/system.brewfile.inc.mk

include $(SANE_MK_ROOT)/extra/debug.env.inc.mk

include $(SANE_MK_ROOT)/extra/deps.corepack.inc.mk
include $(SANE_MK_ROOT)/extra/deps.git.inc.mk
include $(SANE_MK_ROOT)/extra/deps.uv.inc.mk
include $(SANE_MK_ROOT)/extra/deps.vscode.inc.mk

include $(SANE_MK_ROOT)/extra/check.actionlint.inc.mk
include $(SANE_MK_ROOT)/extra/check.editorconfig-checker.inc.mk
include $(SANE_MK_ROOT)/extra/check.jscpd.inc.mk
include $(SANE_MK_ROOT)/extra/check.markdownlint.inc.mk
include $(SANE_MK_ROOT)/extra/check.ruff.inc.mk
include $(SANE_MK_ROOT)/extra/check.shellcheck.inc.mk
include $(SANE_MK_ROOT)/extra/check.shfmt.inc.mk
include $(SANE_MK_ROOT)/extra/check.trufflehog.inc.mk
include $(SANE_MK_ROOT)/extra/check.pyrefly.inc.mk
include $(SANE_MK_ROOT)/extra/check.ty.inc.mk
include $(SANE_MK_ROOT)/extra/check.yamllint.inc.mk

include $(SANE_MK_ROOT)/extra/test.bats.inc.mk
include $(SANE_MK_ROOT)/extra/test.pytest.inc.mk

include $(SANE_MK_ROOT)/extra/misc.docker.inc.mk
include $(SANE_MK_ROOT)/extra/misc.scc.inc.mk

SANE_SYSTEM += \
	system/brewfile \

SANE_DEPS += \
	deps/corepack \
	deps/uv \

SANE_DEPS_UPGRADE += \
	deps/upgrade/corepack \
	deps/upgrade/uv \

SANE_CHECK_LINTERS_CORE += \
	check/editorconfig-checker \
	check/markdownlint \
	check/yamllint \

SANE_CHECK_LINTERS_PYTHON += \
	check/ruff \
	check/ty \
	check/pyrefly \

SANE_CHECK_LINTERS_SHELL += \
	check/shellcheck \
	check/shfmt \

SANE_CHECK_LINTERS += \
	$(SANE_CHECK_LINTERS_CORE) \
	$(SANE_CHECK_LINTERS_SHELL) \
	$(SANE_CHECK_LINTERS_PYTHON) \

SANE_CHECK_INFOSEC += \
	check/trufflehog \

# NOTE jscpd is slow. Disabled
SANE_CHECK_MISC += \
	noop/check/jscpd \

SANE_CHECK += \
	$(SANE_CHECK_LINTERS) \
	$(SANE_CHECK_INFOSEC) \
	$(SANE_CHECK_MISC) \

SANE_TEST += \
	test/bats \
	test/pytest \

SANE_DEBUG_OS ?=
SANE_DEBUG_ENV ?=
SANE_DEBUG += \
	$(SANE_DEBUG_OS) \
	$(SANE_DEBUG_ENV) \
	$(patsubst deps/%,debug/%,$(SANE_DEPS)) \
	$(patsubst check/%,debug/%,$(SANE_CHECK)) \
	$(patsubst test/%,debug/%,$(SANE_TEST)) \
	debug/scc \

ifeq ($(MAKE_PATH),$(GIT_ROOT))
SANE_DEPS += \
	deps/git \
	deps/vscode \

SANE_DEPS_FILES += \
	.editorconfig \
	.gitignore \
	.gitattributes \
	.mailmap \

ifeq (,$(wildcard .markdownlint.json .markdownlint.jsonc .markdownlint.yaml .markdownlint.yml .markdownlintrc))
SANE_DEPS_FILES += .markdownlint.jsonc
endif

ifeq (,$(wildcard .ruff.toml ruff.toml))
SANE_DEPS_FILES += .ruff.toml
endif

ifeq (,$(wildcard .shellcheckrc shellcheckrc))
SANE_DEPS_FILES += .shellcheckrc
endif

ifeq (,$(wildcard .yamllint .yamllint.yaml .yamllint.yml))
SANE_DEPS_FILES += .yamllint
endif

SANE_DEPS_FOLDERS += \
	deps/folders/bin \
	deps/folders/config \
	deps/folders/dist \
	deps/folders/docs \
	deps/folders/test \
	deps/folders/tmp \

SANE_DEPS_GITIGNORE += \
	deps/gitignore/corepack \
	deps/gitignore/uv \
	deps/gitignore/vscode \

SANE_CHECK_LINTERS_CORE += \
	check/actionlint \

endif

.editorconfig:
	$(LN) -s $(SANE_MK_ROOT_REL)/config/dot$@ $@


.gitattributes:
	$(CP) $(SANE_MK_ROOT_REL)/config/dot$@ $@


.gitignore:
	$(CP) $(SANE_MK_ROOT_REL)/config/dot$@ $@


.github/actionlint.yaml:
	$(TOUCH) $@


.mailmap:
	$(TOUCH) $@


.markdownlint.jsonc:
	$(LN) -s $(SANE_MK_ROOT_REL)/config/dot$@ $@


.ruff.toml:
	$(LN) -s $(SANE_MK_ROOT_REL)/config/dot$@ $@


.shellcheckrc:
	$(LN) -s $(SANE_MK_ROOT_REL)/config/dot$@ $@


.yamllint:
	$(LN) -s $(SANE_MK_ROOT_REL)/config/dot$@ $@


.PHONY: deps/folders/bin
deps/folders/bin:
	$(MKDIR) bin/


.PHONY: deps/folders/config
deps/folders/config:
	$(MKDIR) config/


.PHONY: deps/folders/dist
deps/folders/dist:
	$(MKDIR) dist/


.PHONY: deps/folders/docs
deps/folders/docs:
	$(MKDIR) docs/


.PHONY: deps/folders/test
deps/folders/test:
	$(MKDIR) test/


.PHONY: deps/folders/tmp
deps/folders/tmp: .gitignore
	$(MKDIR) tmp/

# END # extra

include $(SANE_MK_ROOT)/misc.lazy.inc.mk

# END # includes

SANE_MK_INCLUDED := 1

endif
