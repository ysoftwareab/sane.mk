# ------------------------------------------------------------------------------

$(GIT_COMMON_DIR)/info/attributes: $(SANE_MK_ROOT)/gitconfig/dot.gitattributes_global
	$(MKDIR) $(dir $@)
	$(LN) -s $< $@


$(GIT_COMMON_DIR)/info/exclude: $(SANE_MK_ROOT)/gitconfig/dot.gitignore_global
	$(MKDIR) $(dir $@)
	$(LN) -s $< $@


.PHONY: deps/git
deps/git: $(GIT_COMMON_DIR)/info/attributes
deps/git: $(GIT_COMMON_DIR)/info/exclude
deps/git:
	:
