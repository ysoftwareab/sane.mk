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

include $(SANE_MK_ROOT)/target.env.inc.mk
include $(SANE_MK_ROOT)/target.help.inc.mk
include $(SANE_MK_ROOT)/target.lazy.inc.mk
include $(SANE_MK_ROOT)/target.noop.inc.mk
include $(SANE_MK_ROOT)/target.printvar.inc.mk
include $(SANE_MK_ROOT)/target.verbose.inc.mk

include $(SANE_MK_ROOT)/extra/target.password.inc.mk
include $(SANE_MK_ROOT)/extra/target.transcrypt.inc.mk

include $(SANE_MK_ROOT)/extra/deps.corepack.inc.mk
include $(SANE_MK_ROOT)/extra/deps.uv.inc.mk
include $(SANE_MK_ROOT)/extra/deps.vscode.inc.mk

include $(SANE_MK_ROOT)/extra/check.actionlint.inc.mk
include $(SANE_MK_ROOT)/extra/check.black.inc.mk
include $(SANE_MK_ROOT)/extra/check.editorconfig-checker.inc.mk
include $(SANE_MK_ROOT)/extra/check.markdownlint.inc.mk
include $(SANE_MK_ROOT)/extra/check.shellcheck.inc.mk
include $(SANE_MK_ROOT)/extra/check.shfmt.inc.mk
include $(SANE_MK_ROOT)/extra/check.trufflehog.inc.mk
include $(SANE_MK_ROOT)/extra/check.yamllint.inc.mk

include $(SANE_MK_ROOT)/target.std.inc.mk

include $(SANE_MK_ROOT)/misc.lazy.inc.mk

# END # includes

SANE_DEPS += \
	deps/corepack \
	deps/uv \
	deps/vscode \

SANE_CHECK += \
	check/actionlint \
	check/black \
	check/editorconfig-checker \
	check/markdownlint \
	check/shellcheck \
	check/shfmt \
	check/trufflehog \
	check/yamllint \

SANE_MK_INCLUDED := 1

endif
