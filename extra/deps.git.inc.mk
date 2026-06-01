export NBSTRIPOUT_VSN ?= >=0.9.0,<0.10

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
# FIXME needs more work
# 	$(GIT) config filter.nbstripout.clean "uvx 'nbstripout$(NBSTRIPOUT_VSN)'"
# 	$(GIT) config filter.nbstripout.smudge "cat"
# 	$(GIT) config filter.nbstripout.required "true"
# 	$(GIT) config diff.ipynb.textconv "uvx 'nbstripout$(NBSTRIPOUT_VSN)' -t"
