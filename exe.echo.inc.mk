# ECHO2 can be used for e.g. pointing to
# an executable that outputs teamcity messages

ECHO2 ?= $(ECHO) $$($(DATE) "+%H:%M:%S")
ECHO_DO = $(ECHO2) -- "[DO  ]"
ECHO_DONE = $(ECHO2) -- "[DONE]"
ECHO_INDENT = $(ECHO) -n $$($(DATE) "+%H:%M:%S") -- "      " | $(SED) "s/./ /g" && $(ECHO)
ECHO_NEXT = $(ECHO2) -- "[NEXT]"
ECHO_Q = $(ECHO2) -- "[Q   ]"
ECHO_SKIP = $(ECHO2) -- "[SKIP]"

ECHO_ERR = $(ECHO2) -- "[ERR ]"
ECHO_INFO = $(ECHO2) -- "[INFO]"
ECHO_WARN = $(ECHO2) -- "[WARN]"
