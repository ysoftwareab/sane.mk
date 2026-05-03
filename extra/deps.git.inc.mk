# ------------------------------------------------------------------------------

.PHONY: deps/git
deps/git:
	$(LN) -s $(SANE_MK_ROOT)/config/dot.gitattributes_global $(GIT_DIR)/info/attributes || \
		$(LN) -s $(SANE_MK_ROOT)/config/dot.gitattributes_global $(GIT_COMMON_DIR)/info/attributes
	$(LN) -s $(SANE_MK_ROOT)/config/dot.gitignore_global $(GIT_DIR)/info/exclude || \
		$(LN) -s $(SANE_MK_ROOT)/config/dot.gitignore_global $(GIT_COMMON_DIR)/info/exclude
