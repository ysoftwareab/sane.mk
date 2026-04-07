# ECHO2 can be used for e.g. pointing to
# an executable that outputs teamcity messages

ECHO2 ?= $(ECHO)
ECHO_DO = $(ECHO2) -- "[DO  ]"
ECHO_DONE = $(ECHO2) -- "[DONE]"
ECHO_INDENT = $(ECHO2) -- "      "
ECHO_NEXT = $(ECHO2) -- "[NEXT]"
ECHO_Q = $(ECHO2) -- "[Q   ]"
ECHO_SKIP = $(ECHO2) -- "[SKIP]"

ECHO_ERR = $(ECHO2) -- "[ERR ]"
ECHO_INFO = $(ECHO2) -- "[INFO]"
ECHO_WARN = $(ECHO2) -- "[WARN]"
