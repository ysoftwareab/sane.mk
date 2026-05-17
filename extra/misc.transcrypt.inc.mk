DEFAULT_FILES_FILTER_OUT += \
	transcrypt $(GIT_ROOT_REL)/transcrypt \

TRANSCRYPT_CIPHER ?= aes-256-cbc
TRANSCRYPT_PASSWORD ?=

IS_TRANSCRYPTED = $(shell $(GIT) config --local transcrypt.password >/dev/null && $(ECHO) true || $(ECHO) false)

TRANSCRYPT_FILES = $(shell $(TRANSCRYPT) --list 2>/dev/null || true)
$(call make-lazy-once,TRANSCRYPT_FILES)
TRANSCRYPT_FILES_FILTER_OUT = $(TRANSCRYPT_FILES)
DEFAULT_FILES_FILTER_OUT += $(TRANSCRYPT_FILES_FILTER_OUT)

ifeq (true,$(IS_TRANSCRYPTED))
IS_DECRYPTED = true
TRANSCRYPT_FILES_FILTER_OUT =
# enforce local (locked version) transcrypt for deterministic behaviour
TRANSCRYPT = $(GIT_ROOT)/transcrypt
else ifneq (,$(wildcard $(GIT_ROOT)/transcrypt))
TRANSCRYPT = $(GIT_ROOT)/transcrypt
else
TRANSCRYPT ?= $(call which,TRANSCRYPT,transcrypt)
TRANSCRYPT_FILES =
endif
TRANSCRYPT_SET = $(TRANSCRYPT) --yes --set-openssl-path=$(OPENSSL3) --cipher "$(TRANSCRYPT_CIPHER)"

# ------------------------------------------------------------------------------

.PHONY: transcrypt
transcrypt: ## Generate a transcrypt password.
ifeq (,$(CI))
	$(ECHO_ERR) "Cannot run 'make transcrypt' in CI."
	exit 1
endif
ifeq (true,$(IS_TRANSCRYPTED))
	$(ECHO_ERR) "Already transcrypted."
	$(ECHO_INFO) "Run 'make transcrypt/rekey' if you would like to change the transcrypt password."
	exit 1
else ifeq (,$(TRANSCRYPT_PASSWORD))
	$(TRANSCRYPT_SET)
else
	$(TRANSCRYPT_SET) --password "$(TRANSCRYPT_PASSWORD)"
endif
ifneq (,$(wildcard $(GIT_ROOT)/transcrypt))
	$(CP) $(TRANSCRYPT) $(GIT_ROOT)/transcrypt
	$(ECHO_INFO) "transcrypt locked to $(GIT_ROOT)/transcrypt. $(shell $(TRANSCRYPT) --version | $(HEAD) -n1)."
endif
	$(ECHO_WARN) "Store safely your new transcrypt password below."
	$(ECHO_INDENT) "$$($(TRANSCRYPT) --display | $(TAIL) -n1)"


.PHONY: transcrypt/rekey
transcrypt/rekey:
ifneq (,$(CI))
	$(ECHO_ERR) "Cannot run 'make transcrypt/rekey' in CI."
	exit 1
endif
	$(TRANSCRYPT_SET) --rekey
ifneq (,$(wildcard $(GIT_ROOT)/transcrypt))
	$(CP) $(TRANSCRYPT) $(GIT_ROOT)/transcrypt
	$(ECHO_INFO) "transcrypt locked to $(GIT_ROOT)/transcrypt. $(shell $(TRANSCRYPT) --version | $(HEAD) -n1)."
endif
	$(ECHO_WARN) "Store safely your new transcrypt password below."
	$(ECHO_INDENT) "$$($(TRANSCRYPT) --display | $(TAIL) -n1)"


.PHONY: decrypt
decrypt: ## Decrypt with transcrypt. Encrypt back with 'make decrypt/nuke'.
ifeq (true,$(IS_TRANSCRYPTED))
		$(ECHO_INFO) "Already transcrypted."
else ifeq (true,$(CI)$(TRANSCRYPT_PASSWORD))
	$(ECHO_ERR) "No TRANSCRYPT_PASSWORD found."
	exit 1
else
	TRANSCRYPT_PASSWORD="$(TRANSCRYPT_PASSWORD)"; \
	[[ -n "$${TRANSCRYPT_PASSWORD}" ]] || { \
		$(ECHO_Q) "Please enter TRANSCRYPT_PASSWORD below. Press Ctrl+C to Cancel."; \
		read -s -r -p "TRANSCRYPT_PASSWORD=" TRANSCRYPT_PASSWORD; \
		[[ -n "$${TRANSCRYPT_PASSWORD:-}" ]] || exit 1; \
	}; \
	$(ECHO); \
	$(ECHO_INFO) "TRANSCRYPT_PASSWORD=$${TRANSCRYPT_PASSWORD:0:2}***$${TRANSCRYPT_PASSWORD: -2}"; \
	$(TRANSCRYPT_SET) --force --password "$${TRANSCRYPT_PASSWORD}"
endif


.PHONY: decrypt/nuke
decrypt/nuke:
	$(TRANSCRYPT) --yes --force --flush-credentials
