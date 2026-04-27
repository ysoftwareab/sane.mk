include sane.extra.mk

DEFAULT_FILES_FILTER_OUT += \
	$(wildcard bin/transcrypt@*/transcrypt) \

JSCPD_FILES_FILTER_OUT += \
	sane.extra.mk.tpl \
	sane.std.mk.tpl \

# ------------------------------------------------------------------------------

.PHONY: dist
dist: ## Build distribution files
	$(MKDIR) dist
	$(CP) sane.mk dist/
	./sane.std.mk.tpl > dist/sane.std.mk
	./sane.extra.mk.tpl > dist/sane.extra.mk
