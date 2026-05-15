PASSWORD_PREFIX = sane
PASSWORD_PREFIX_LENGTH = $(shell $(ECHO) -n $(PASSWORD_PREFIX) | $(WC) -c)

# ------------------------------------------------------------------------------

.PHONY: password
password: password/32
password: ## Create a random password.
	:


.PHONY: password/%
password/%:
	PASSWORD_LENGTH=$$(($* - $(PASSWORD_PREFIX_LENGTH) -1)); \
		STR="$$(LC_ALL=C $(TR) -dc "a-zA-Z0-9" < /dev/urandom | $(HEAD) -c "$${PASSWORD_LENGTH}" || true)"; \
		$(ECHO) "$(PASSWORD_PREFIX)_$${STR}"
