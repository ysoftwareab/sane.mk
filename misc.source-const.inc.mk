# CONST*.inc{,.secret} files are "env" file i.e. "KEY=VALUE" lines intended for both GNU Make and Bash
# Empty or # commented lines are ignored.

ifneq (,$(wildcard $(GIT_ROOT)/CONST*.inc))
include $(wildcard $(GIT_ROOT)/CONST*.inc)
export $(shell \
	$(CAT) $(wildcard $(GIT_ROOT)/CONST*.inc) \
	| $(GREP) --only-matching "^[^ =]\+=" \
	| $(SED) "s/=$$//g")
endif

ifneq (,$(wildcard $(MAKE_PATH)/CONST*.inc))
include $(wildcard $(MAKE_PATH)/CONST*.inc)
export $(shell \
	$(CAT) $(wildcard $(MAKE_PATH)/CONST*.inc) \
	| $(GREP) --only-matching "^[^ =]\+=" \
	| $(SED) "s/=$$//g")
endif

ifeq (true,$(IS_DECRYPTED))

ifneq (,$(wildcard $(GIT_ROOT)/CONST*.inc.secret))
include $(wildcard $(GIT_ROOT)/CONST*.inc.secret)
export $(shell \
	$(CAT) $(wildcard $(GIT_ROOT)/CONST*.inc.secret) \
	| $(GREP) --only-matching "^[^ =]\+=" \
	| $(SED) "s/=$$//g")
endif

ifneq (,$(wildcard $(MAKE_PATH)/CONST*.inc.secret))
include $(wildcard $(MAKE_PATH)/CONST*.inc.secret)
export $(shell \
	$(CAT) $(wildcard $(MAKE_PATH)/CONST*.inc.secret) \
	| $(GREP) --only-matching "^[^ =]\+=" \
	| $(SED) "s/=$$//g")
endif

endif
