include sane.extra.mk

# ------------------------------------------------------------------------------

.PHONY: dist
dist: ## Build distribution files
	$(MKDIR) dist
	$(CP) sane.mk dist/
	./sane.std.mk.tpl > dist/sane.std.mk
	./sane.extra.mk.tpl > dist/sane.extra.mk
