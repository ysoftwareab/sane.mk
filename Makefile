ifdef SANE_MK_INCLUDED
else

ifndef SANE_MK_DIR
SANE_MK_DIR := $(shell dirname $(abspath $(lastword $(MAKEFILE_LIST))))
endif

include $(SANE_MK_DIR)/sane.mk

include $(SANE_MK_DIR)/exe.which.inc.mk # needed by the other exe.*.inc.mk files
include $(SANE_MK_DIR)/exe.echo.inc.mk
include $(SANE_MK_DIR)/exe.gnu.inc.mk
include $(SANE_MK_DIR)/exe.misc.inc.mk

include $(SANE_MK_DIR)/chars.inc.mk
include $(SANE_MK_DIR)/git.inc.mk
include $(SANE_MK_DIR)/os.inc.mk

include $(SANE_MK_DIR)/target.env.inc.mk
include $(SANE_MK_DIR)/target.help.inc.mk
include $(SANE_MK_DIR)/target.lazy.inc.mk
include $(SANE_MK_DIR)/target.noop.inc.mk
include $(SANE_MK_DIR)/target.printvar.inc.mk
include $(SANE_MK_DIR)/target.verbose.inc.mk

MAKEFILE_LAZY ?= true
ifeq (true,$(MAKEFILE_LAZY))
ifeq ($(MAKECMDGOALS),$(filter-out %Makefile.lazy,$(MAKECMDGOALS)))
ifeq (,$(wildcard Makefile.lazy))
$(info [DO  ] Generating Makefile.lazy...)
$(info $(shell $(MAKE) Makefile.lazy))
$(info [DONE])
$(info )
endif
include Makefile.lazy
endif
endif

SANE_MK_INCLUDED := 1
endif
