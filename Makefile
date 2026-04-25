include sane.extended.mk

.PHONY: dist
dist: ## Build distribution files
	$(MKDIR) dist
	$(CP) sane.mk dist/
	./sane.extended.mk.tpl > dist/sane.extended.mk
