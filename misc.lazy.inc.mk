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
